/**
 * SettingsSection.jsx — Grouped settings rows for the Account tab
 */

import React, { useState } from 'react';
import ResetConfirmModal from '../molecules/ResetConfirmModal';

export default function SettingsSection({
    theme, onToggleTheme, fontSize, onSetFontSize,
    isOnline, lastSyncDate, onExportData, onResetProgress,
}) {
    const [showReset, setShowReset] = useState(false);

    return (
        <div style={{ padding: '0 16px', display: 'flex', flexDirection: 'column', gap: '12px' }}>
            {/* Settings Card */}
            <div style={{ backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)', overflow: 'hidden' }}>
                <SettingRow icon={<MoonIcon />} label="Theme"
                    control={<PillToggle options={['Dark', 'Light']} active={theme === 'dark' ? 0 : 1} onChange={onToggleTheme} />}
                />
                <SettingRow icon={<TextIcon />} label="Font Size"
                    control={<PillToggle options={['Normal', 'Large']} active={fontSize === 'normal' ? 0 : 1} onChange={() => onSetFontSize(fontSize === 'normal' ? 'large' : 'normal')} />}
                />
                <SettingRow icon={<CloudIcon />} label="Data Sync"
                    subtext={lastSyncDate ? `Last synced: ${new Date(lastSyncDate).toLocaleDateString()}` : 'Never synced'}
                    control={<span style={{ fontSize: 'var(--text-xs)', fontWeight: 600, color: isOnline ? 'var(--color-accent-primary)' : 'var(--color-text-muted)' }}>{isOnline ? 'Online' : 'Offline'}</span>}
                />
                <SettingRow icon={<DownloadIcon />} label="Export My Data" onClick={onExportData}
                    control={<ChevronRight />}
                />
                <SettingRow icon={<MailIcon />} label="Send Feedback"
                    onClick={() => window.open('mailto:?subject=App%20Feedback', '_self')}
                    control={<ChevronRight />} isLast
                />
            </div>

            {/* Danger Zone */}
            <div style={{ borderTop: '1px solid var(--color-border-subtle)', paddingTop: '12px' }}>
                <p style={{ fontSize: 'var(--text-xs)', fontWeight: 600, color: 'var(--color-error)', marginBottom: '8px', paddingLeft: '4px' }}>
                    Danger Zone
                </p>
                <div style={{ backgroundColor: 'var(--color-bg-secondary)', borderRadius: 'var(--radius-xl)', overflow: 'hidden' }}>
                    <SettingRow
                        icon={<TrashIcon />} label="Reset All Progress" isLast
                        onClick={() => setShowReset(true)}
                        control={<ChevronRight />}
                        danger
                    />
                </div>
            </div>

            <ResetConfirmModal isOpen={showReset} onCancel={() => setShowReset(false)} onConfirm={onResetProgress} />
        </div>
    );
}

function SettingRow({ icon, label, subtext, control, onClick, isLast, danger }) {
    const Tag = onClick ? 'button' : 'div';
    return (
        <Tag onClick={onClick} style={{
            display: 'flex', alignItems: 'center', gap: '12px', width: '100%',
            padding: '16px', borderBottom: isLast ? 'none' : '1px solid var(--color-border-subtle)',
            background: 'none', border: 'none', cursor: onClick ? 'pointer' : 'default', textAlign: 'left',
            borderBottomWidth: isLast ? 0 : '1px', borderBottomStyle: 'solid', borderBottomColor: 'var(--color-border-subtle)',
        }}>
            <span style={{ color: danger ? 'var(--color-error)' : 'var(--color-text-muted)', flexShrink: 0 }}>{icon}</span>
            <div style={{ flex: 1 }}>
                <p style={{ fontSize: 'var(--text-sm)', fontWeight: 500, color: danger ? 'var(--color-error)' : 'var(--color-text-primary)', margin: 0 }}>{label}</p>
                {subtext && <p style={{ fontSize: '0.625rem', color: 'var(--color-text-muted)', marginTop: '2px' }}>{subtext}</p>}
            </div>
            {control}
        </Tag>
    );
}

function PillToggle({ options, active, onChange }) {
    return (
        <div style={{ display: 'flex', backgroundColor: 'var(--color-bg-tertiary)', borderRadius: 'var(--radius-full)', padding: '2px' }}>
            {options.map((opt, i) => (
                <button key={opt} onClick={i !== active ? onChange : undefined} style={{
                    padding: '4px 12px', borderRadius: 'var(--radius-full)', border: 'none',
                    fontSize: '0.6875rem', fontWeight: 600, cursor: 'pointer',
                    backgroundColor: i === active ? 'var(--color-accent-blue)' : 'transparent',
                    color: i === active ? 'white' : 'var(--color-text-muted)',
                    transition: 'all 0.15s ease',
                }}>{opt}</button>
            ))}
        </div>
    );
}

// Inline SVG icons
function MoonIcon() { return <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" /></svg>; }
function TextIcon() { return <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><path d="M4 7V4h16v3M9 20h6M12 4v16" /></svg>; }
function CloudIcon() { return <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><path d="M18 10a6 6 0 00-12 0 4 4 0 100 8h12a3 3 0 100-6 3 3 0 00-3-2z" /></svg>; }
function DownloadIcon() { return <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4M7 10l5 5 5-5M12 15V3" /></svg>; }
function MailIcon() { return <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><rect x="2" y="4" width="20" height="16" rx="2" /><path d="M22 4l-10 8L2 4" /></svg>; }
function TrashIcon() { return <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5"><polyline points="3 6 5 6 21 6" /><path d="M19 6v14a2 2 0 01-2 2H7a2 2 0 01-2-2V6m3 0V4a2 2 0 012-2h4a2 2 0 012 2v2" /></svg>; }
function ChevronRight() { return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--color-text-muted)" strokeWidth="2"><polyline points="9 18 15 12 9 6" /></svg>; }
