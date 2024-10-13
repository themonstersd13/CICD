import { test } from 'bun:test';
import fetch from 'node-fetch';

const baseUrl = 'http://localhost:5000'; 

test('GET /ping returns PONG', async () => {
    const response = await fetch(`${baseUrl}/ping`);
    const text = await response.text();

    if (response.status !== 200 || text !== 'PONG') {
        throw new Error(`Expected 200 PONG, got ${response.status} ${text}`);
    }
});
