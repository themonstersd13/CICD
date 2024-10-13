const express = require('express');
const Todo = require('../models/Todo');
const router = express.Router();

router.get('/todos', async (req, res) => {
  const todos = await Todo.find();
  res.json(todos);
});

router.post('/todos', async (req, res) => {
  const newTodo = new Todo({
    task: req.body.task,
  });
  await newTodo.save();
  res.json(newTodo);
});

router.put('/todos/:id', async (req, res) => {
  const updatedTodo = await Todo.findByIdAndUpdate(req.params.id, { completed: req.body.completed }, { new: true });
  res.json(updatedTodo);
});

router.delete('/todos/:id', async (req, res) => {
  await Todo.findByIdAndDelete(req.params.id);
  res.json({ message: 'Todo deleted' });
});



module.exports = router;

