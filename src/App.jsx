import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import SessionDashboard from './components/session/SessionDashboard';
import ReviewSession from './components/session/ReviewSession';
import LearningSession from './components/session/LearningSession';
import DevPanel from './devtools/DevPanel';

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<SessionDashboard />} />
        <Route path="/review" element={<ReviewSession />} />
        <Route path="/learn" element={<LearningSession />} />
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>

      {/* Dev panel overlay — only renders in development mode */}
      <DevPanel />
    </div>
  );
}

export default App;

