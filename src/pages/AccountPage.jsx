/**
 * AccountPage.jsx — Account tab page assembly
 */

import React, { useRef } from 'react';
import { useAccountData } from '../hooks/useAccountData';
import AccountProfile from '../components/organisms/AccountProfile';
import SettingsSection from '../components/organisms/SettingsSection';

export default function AccountPage() {
    const data = useAccountData();
    const tapCountRef = useRef(0);
    const tapTimerRef = useRef(null);

    function handleVersionTap() {
        tapCountRef.current += 1;
        if (tapTimerRef.current) clearTimeout(tapTimerRef.current);
        tapTimerRef.current = setTimeout(() => { tapCountRef.current = 0; }, 2000);
        if (tapCountRef.current >= 3) {
            tapCountRef.current = 0;
            window.dispatchEvent(new CustomEvent('open-dev-panel'));
        }
    }

    return (
        <div style={{ paddingBottom: '80px', display: 'flex', flexDirection: 'column', gap: '16px' }}>
            <AccountProfile
                displayName={data.displayName} onNameChange={data.setDisplayName}
                currentRank={data.currentRank} nextRank={data.nextRank}
                wordsToNextRank={data.wordsToNextRank} totalMastered={data.totalMastered}
            />
            <SettingsSection
                theme={data.theme} onToggleTheme={data.toggleTheme}
                fontSize={data.fontSize} onSetFontSize={data.setFontSize}
                isOnline={data.isOnline} lastSyncDate={data.lastSyncDate}
                onExportData={data.handleExportData} onResetProgress={data.handleResetProgress}
            />
            <p onClick={handleVersionTap} style={{ textAlign: 'center', fontSize: 'var(--text-xs)', color: 'var(--color-text-muted)', padding: '16px 0', cursor: 'default', userSelect: 'none' }}>
                Version 1.0.0 (Beta)
            </p>
        </div>
    );
}
