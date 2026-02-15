import React from 'react';
import LearningFlow from './pages/LearningFlow';
// import QuizTest from './pages/QuizTest'; // Uncomment to test Quiz component

function App() {
  // For MVP, directly show LearningFlow
  // TODO PHASE 8: Add home screen, batch selection, proper routing

  // To test Quiz component, uncomment the import above and change to:
  // return <QuizTest />;
  return (
    <div className="App">
      <LearningFlow />
    </div>
  );
}

export default App;
