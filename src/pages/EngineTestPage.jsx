/**
 * @deprecated LEGACY TEST PAGE — not used by the active application.
 * Originally created to run scheduling engine unit tests in-browser.
 * No route currently points here. Safe to delete once no longer needed for debugging.
 */

import React, { useEffect, useState } from 'react';
import { runAllTests } from '../engine/engineTests';

const EngineTestPage = () => {
    const [results, setResults] = useState(null);

    useEffect(() => {
        // Run tests on mount
        const result = runAllTests();
        setResults(result);
    }, []);

    return (
        <div style={{ padding: '2rem', fontFamily: 'monospace', background: '#1a1a2e', color: '#e0e0e0', minHeight: '100vh' }}>
            <h1 style={{ color: '#00d4ff' }}>🧪 Engine Test Runner</h1>
            <p>Open browser DevTools console to see detailed test output.</p>
            {results && (
                <div style={{ marginTop: '1rem', padding: '1rem', background: '#16213e', borderRadius: '8px' }}>
                    <p style={{ color: '#00ff88', fontSize: '1.2rem' }}>
                        ✅ Passed: {results.passed}
                    </p>
                    <p style={{ color: results.failed > 0 ? '#ff4444' : '#888', fontSize: '1.2rem' }}>
                        {results.failed > 0 ? '❌' : '✅'} Failed: {results.failed}
                    </p>
                    <p style={{ marginTop: '0.5rem', color: '#888' }}>
                        Total: {results.passed + results.failed}
                    </p>
                </div>
            )}
        </div>
    );
};

export default EngineTestPage;
