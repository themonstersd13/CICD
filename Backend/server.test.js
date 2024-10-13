import { test, beforeAll, afterAll } from 'bun:test';
import fetch from 'node-fetch';
import express from 'express';

let server;
const baseUrl = 'http://localhost:5000'
const app = express()

app.get('/ping', (req, res) => {
  res.status(200).send('PONG')
});

beforeAll(() => {
  server = app.listen(5000, () => {
    console.log('Server started on port 5000');
  });
});

afterAll(() => {
  server.close(() => {
    console.log('Server stopped');
  });
});

test('GET /ping returns PONG', async () => {
  const response = await fetch(`${baseUrl}/ping`);
  const text = await response.text();

  if (response.status !== 200) {
    throw new Error(`Expected status 200, got ${response.status}`);
  }

  if (text !== 'PONG') {
    throw new Error(`Expected text "PONG", got "${text}"`);
  }
});
