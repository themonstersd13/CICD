import { useEffect, useState } from 'react';
import axios from 'axios';

function TodoApp() {
  const [todos, setTodos] = useState([]);
  const [newTask, setNewTask] = useState('');

  useEffect(() => {
    axios.get('http://localhost:5000/api/todos')
      .then(response => setTodos(response.data))
      .catch(error => console.error(error));
  }, []);

  const addTodo = () => {
    if (!newTask) return;
    axios.post('http://localhost:5000/api/todos', { task: newTask })
      .then(response => {
        setTodos([...todos, response.data]);
        setNewTask('');
      })
      .catch(error => console.error(error));
  };

  const toggleTodo = (id, completed) => {
    axios.put(`http://localhost:5000/api/todos/${id}`, { completed: !completed })
      .then(response => {
        setTodos(todos.map(todo => todo._id === id ? response.data : todo));
      })
      .catch(error => console.error(error));
  };

  const deleteTodo = (id) => {
    axios.delete(`http://localhost:5000/api/todos/${id}`)
      .then(() => {
        setTodos(todos.filter(todo => todo._id !== id));
      })
      .catch(error => console.error(error));
  };

return (
  <div className="min-h-screen bg-zinc-600 p-8">
    <div className="max-w-md mx-auto bg-base-100 p-6 rounded-lg shadow-xl">
      <h1 className="text-3xl font-bold mb-4 text-center text-primary">Todo List</h1>

      {/* Input and Add Button */}
      <div className="flex gap-2 mb-4">
        <input
          type="text"
          className="input input-bordered input-primary w-full"
          placeholder="Add a new task..."
          value={newTask}
          onChange={(e) => setNewTask(e.target.value)}
        />
        <button className="btn btn-primary" onClick={addTodo}>
          Add
        </button>
      </div>

      {/* Todo List */}
      <ul className="list-none">
        {todos.map((todo) => (
          <li key={todo._id} className="flex items-center justify-between p-2 border-b border-base-300">
            <div className="flex items-center">
              <input
                type="checkbox"
                className="checkbox checkbox-primary mr-2"
                checked={todo.completed}
                onChange={() => toggleTodo(todo._id, todo.completed)}
              />
              <span className={`text-base ${todo.completed ? 'line-through' : ''}`}>
                {todo.task}
              </span>
            </div>
            <button className="btn btn-error btn-sm" onClick={() => deleteTodo(todo._id)}>
              Delete
            </button>
          </li>
        ))}
      </ul>
    </div>
  </div>
);
}

export default TodoApp;
