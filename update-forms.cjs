const fs = require('fs');
const path = require('path');

const dataPath = path.join(__dirname, 'src/data/batch-1.json');
const data = require(dataPath);

const verbForms = {
    'be': { base: 'be', thirdPerson: 'is', pastSingular: 'was', pastPlural: 'were', pastParticiple: 'been', presentParticiple: 'being', firstPerson: 'am', plural: 'are' },
    'have': { base: 'have', thirdPerson: 'has', past: 'had', pastParticiple: 'had', presentParticiple: 'having' },
    'do': { base: 'do', thirdPerson: 'does', past: 'did', pastParticiple: 'done', presentParticiple: 'doing' },
    'say': { base: 'say', thirdPerson: 'says', past: 'said', pastParticiple: 'said', presentParticiple: 'saying' },
    'go': { base: 'go', thirdPerson: 'goes', past: 'went', pastParticiple: 'gone', presentParticiple: 'going' },
    'get': { base: 'get', thirdPerson: 'gets', past: 'got', pastParticiple: 'gotten', presentParticiple: 'getting' },
    'make': { base: 'make', thirdPerson: 'makes', past: 'made', pastParticiple: 'made', presentParticiple: 'making' },
    'know': { base: 'know', thirdPerson: 'knows', past: 'knew', pastParticiple: 'known', presentParticiple: 'knowing' },
    'think': { base: 'think', thirdPerson: 'thinks', past: 'thought', pastParticiple: 'thought', presentParticiple: 'thinking' },
    'take': { base: 'take', thirdPerson: 'takes', past: 'took', pastParticiple: 'taken', presentParticiple: 'taking' },
    'see': { base: 'see', thirdPerson: 'sees', past: 'saw', pastParticiple: 'seen', presentParticiple: 'seeing' },
    'come': { base: 'come', thirdPerson: 'comes', past: 'came', pastParticiple: 'come', presentParticiple: 'coming' },
    'want': { base: 'want', thirdPerson: 'wants', past: 'wanted', pastParticiple: 'wanted', presentParticiple: 'wanting' },
    'give': { base: 'give', thirdPerson: 'gives', past: 'gave', pastParticiple: 'given', presentParticiple: 'giving' },
    'use': { base: 'use', thirdPerson: 'uses', past: 'used', pastParticiple: 'used', presentParticiple: 'using' },
    'find': { base: 'find', thirdPerson: 'finds', past: 'found', pastParticiple: 'found', presentParticiple: 'finding' },
    'tell': { base: 'tell', thirdPerson: 'tells', past: 'told', pastParticiple: 'told', presentParticiple: 'telling' },
    'work': { base: 'work', thirdPerson: 'works', past: 'worked', pastParticiple: 'worked', presentParticiple: 'working' },
    'call': { base: 'call', thirdPerson: 'calls', past: 'called', pastParticiple: 'called', presentParticiple: 'calling' },
    'look': { base: 'look', thirdPerson: 'looks', past: 'looked', pastParticiple: 'looked', presentParticiple: 'looking' }
};

const otherForms = {
    'time': { singular: 'time', plural: 'times' },
    'way': { singular: 'way', plural: 'ways' },
    'people': { singular: 'person', plural: 'people' },
    'good': { base: 'good', comparative: 'better', superlative: 'best' },
    'new': { base: 'new', comparative: 'newer', superlative: 'newest' },
    'day': { singular: 'day', plural: 'days' },
    'year': { singular: 'year', plural: 'years' },
    'first': { base: 'first' },
    'thing': { singular: 'thing', plural: 'things' },
    'man': { singular: 'man', plural: 'men' }
};

const allForms = { ...verbForms, ...otherForms };

data.words.forEach(w => {
    // Add forms to word
    if (allForms[w.word]) {
        w.forms = Object.assign({ base: w.word }, allForms[w.word]); // Ensure base exists
    } else {
        w.forms = { base: w.word };
    }

    // Process examples
    w.parts_of_speech.forEach(pos => {
        pos.examples.forEach(ex => {
            const match = ex.sentence.match(/\{([^}]+)\}/);
            if (match) {
                // Special case for 'people' since it's plural but often used as base
                // or where casing matters
                const usedWord = match[1].toLowerCase();
                let foundForm = null;

                for (const [key, val] of Object.entries(w.forms)) {
                    if (val === usedWord) {
                        foundForm = key;
                        break;
                    }
                }

                if (foundForm) {
                    ex.form_used = foundForm;
                } else {
                    console.warn(`[WARN] Could not find form for '${usedWord}' in word '${w.word}'. Falling back to 'base'.`);
                    ex.form_used = 'base';
                }
            } else {
                console.warn(`[WARN] No bracketed word found in example: "${ex.sentence}"`);
                ex.form_used = 'base';
            }
        });
    });
});

fs.writeFileSync(dataPath, JSON.stringify(data, null, 4));
console.log('Successfully updated batch-1.json with explicit word forms!');
