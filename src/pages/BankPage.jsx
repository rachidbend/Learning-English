/**
 * BankPage.jsx — Bank & Stats tab page assembly
 */

import React, { useState } from 'react';
import { AnimatePresence } from 'framer-motion';
import { useBankStats } from '../hooks/useBankStats';

import BankHeroStats from '../components/organisms/BankHeroStats';
import WeeklyGrowthChart from '../components/molecules/WeeklyGrowthChart';
import MilestoneTracker from '../components/molecules/MilestoneTracker';
import WordBankCTA from '../components/molecules/WordBankCTA';
import WordBankModal from '../components/organisms/WordBankModal';
import { analytics } from '../analytics/events';

export default function BankPage() {
    const stats = useBankStats();
    const [bankOpen, setBankOpen] = useState(false);

    const handleOpenBank = () => {
        analytics.track('word_bank_opened', { total_words: stats.totalSeen });
        setBankOpen(true);
    };

    if (stats.isLoading) {
        return (
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', minHeight: '60vh' }}>
                <div style={{ width: 40, height: 40, border: '3px solid var(--color-border-subtle)', borderTopColor: 'var(--color-accent-blue)', borderRadius: '50%', animation: 'spin 0.8s linear infinite' }} />
                <style>{`@keyframes spin { to { transform: rotate(360deg) } }`}</style>
            </div>
        );
    }

    return (
        <>
            <div style={{ paddingBottom: '80px', display: 'flex', flexDirection: 'column', gap: '16px' }}>
                {/* Header */}
                <div style={{ textAlign: 'center', padding: '16px 16px 0' }}>
                    <h2 style={{ fontSize: 'var(--text-2xl)', fontWeight: 'var(--font-weight-bold)', color: 'var(--color-text-primary)', margin: 0 }}>
                        Bank & Stats
                    </h2>
                    <p style={{ fontSize: 'var(--text-sm)', color: 'var(--color-text-secondary)', marginTop: '4px' }}>
                        Your vocabulary treasury
                    </p>
                </div>

                <BankHeroStats
                    currentStreak={stats.currentStreak} totalMastered={stats.totalMastered}
                    currentRank={stats.currentRank} nextRank={stats.nextRank}
                    wordsToNextRank={stats.wordsToNextRank} retentionRate={stats.retentionRate}
                    milestonePercent={stats.milestonePercent}
                />
                <WeeklyGrowthChart weeklyGrowth={stats.weeklyGrowth} />
                <MilestoneTracker
                    totalMastered={stats.totalMastered} milestoneTarget={stats.milestoneTarget}
                    milestonePercent={stats.milestonePercent} currentRank={stats.currentRank}
                />
                <WordBankCTA
                    totalMastered={stats.totalMastered} totalLearning={stats.totalLearning}
                    totalNew={stats.newWords.length} onOpen={handleOpenBank}
                />
            </div>

            <AnimatePresence>
                {bankOpen && (
                    <WordBankModal
                        isOpen onClose={() => setBankOpen(false)}
                        masteredWords={stats.masteredWords} learningWords={stats.learningWords}
                        newWords={stats.newWords} allWords={stats.allWords}
                    />
                )}
            </AnimatePresence>
        </>
    );
}
