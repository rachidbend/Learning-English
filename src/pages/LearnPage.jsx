/**
 * LearnPage.jsx
 * Shell page for Phase 1 — hosts the existing SessionDashboard/LearningSession
 * during transition. Will be redesigned in Phase 2.
 */

import React, { useState } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import SessionDashboard from '../components/organisms/SessionDashboard';
import LearningSession from '../components/organisms/LearningSession';
import ReviewSession from '../components/organisms/ReviewSession';

export default function LearnPage() {
    return (
        <BrowserRouter>
            <Routes>
                <Route path="/" element={<SessionDashboard />} />
                <Route path="/learn" element={<LearningSession />} />
                <Route path="/review" element={<ReviewSession />} />
                <Route path="*" element={<Navigate to="/" replace />} />
            </Routes>
        </BrowserRouter>
    );
}
