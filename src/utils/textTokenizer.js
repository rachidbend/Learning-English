/**
 * textTokenizer.js — Split paragraph text into tappable word tokens
 *
 * Each token preserves attached punctuation so the reader can render
 * each word as a tappable <span> while keeping the text looking natural.
 */

/**
 * Tokenize a paragraph into word tokens.
 * @param {string} text - The paragraph text to tokenize
 * @returns {Array<{ text: string, cleanWord: string }>}
 *   text: the display token including punctuation (e.g. "hello,")
 *   cleanWord: lowercase word without punctuation (e.g. "hello")
 */
export function tokenizeText(text) {
    if (!text) return [];

    // Split on whitespace, preserving each chunk including punctuation
    return text.split(/\s+/).filter(Boolean).map((token) => ({
        text: token,
        cleanWord: token.replace(/[^a-zA-Z''-]/g, '').toLowerCase(),
    }));
}

/**
 * parseHighlighting — Converts {word} markers to <mark> tags
 * Per security_guidelines.md, only used on pre-generated JSON content.
 */
export function parseHighlighting(text) {
    if (!text) return '';
    return text.replace(/\{([^}]+)\}/g, '<mark>$1</mark>');
}
