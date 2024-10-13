const request = require('supertest');
const express = require('express');

const app = express();

app.get('/ping', (req, res) => {
  res.status(200).send('PONG');
});

describe('GET /ping', () => {
  it('should respond with PONG and status 200', async () => {
    const response = await request(app).get('/ping');
    expect(response.status).toBe(200);
    expect(response.text).toBe('PONG');
  });
});
