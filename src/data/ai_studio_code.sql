-- =============================================================================
-- WORD 1: the
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (1, 'the', 'الـ', 'article', 'Used to refer to specific or particular nouns.', 'تستخدم للإشارة إلى أسماء محددة أو معينة.', 'الـ', '[]', '{"singular": "the"}', '/ðə/', 'the.mp3', '{"synonyms": [], "antonyms": [], "word_family": []}', 'The most common word in English, used as a definite article.', 'Beginner', 1);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(1, '{The} sun is very bright today.', 'الشمس ساطعة جداً اليوم.', 'the', 'Nature', 'Easy', 1, 1),
(1, 'Please close {the} door.', 'من فضلك أغلق الباب.', 'the', 'Home', 'Easy', 0, 2),
(1, 'I saw {the} movie you mentioned.', 'شاهدت الفيلم الذي ذكرته.', 'the', 'Entertainment', 'Easy', 0, 3),
(1, '{The} cat is sleeping on the sofa.', 'القطة نائمة على الأريكة.', 'the', 'Animals', 'Easy', 0, 4),
(1, 'This is {the} best day ever.', 'هذا هو أفضل يوم على الإطلاق.', 'the', 'Emotion', 'Easy', 0, 5),
(1, 'Where is {the} nearest station?', 'أين هي أقرب محطة؟', 'the', 'Travel', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(1, 'translation_match', 'easy', 'the', 'en', 'الـ', 'the', NULL, NULL, NULL, 'The definite article "the" translates to the prefix "الـ" in Arabic.'),
(1, 'reverse_translation', 'easy', 'الـ', 'ar', 'the', 'the', NULL, NULL, NULL, '"the" is the English equivalent of the Arabic definite article.'),
(1, 'sentence_completion', 'easy', '___ sun is hot.', 'en', 'The', 'the', '___ sun is hot.', 'The sun is hot.', 0, 'Use "the" for unique celestial bodies.'),
(1, 'sentence_completion', 'easy', 'Open ___ window.', 'en', 'the', 'the', 'Open ___ window.', 'Open the window.', 1, 'Use "the" for specific objects.'),
(1, 'sentence_completion', 'easy', 'This is ___ end.', 'en', 'the', 'the', 'This is ___ end.', 'This is the end.', 2, 'Use "the" before "end".'),
(1, 'sentence_completion', 'easy', 'I like ___ book.', 'en', 'the', 'the', 'I like ___ book.', 'I like the book.', 2, 'Refers to a specific book.'),
(1, 'sentence_completion', 'easy', '___ earth is round.', 'en', 'The', 'the', '___ earth is round.', 'The earth is round.', 0, 'Use "the" for the planet Earth.'),
(1, 'sentence_completion', 'easy', 'Go to ___ park.', 'en', 'the', 'the', 'Go to ___ park.', 'Go to the park.', 2, 'Refers to a specific park.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(1, 'و'), (1, 'في'), (1, 'من'), (1, 'إلى'), (1, 'أنا'), (1, 'هو'), (1, 'هذا'), (1, 'لا'), (1, 'على'), (1, 'أنت'),
(2, 'a'), (2, 'an'), (2, 'and'), (2, 'of'), (2, 'to'), (2, 'in'), (2, 'is'), (2, 'it'), (2, 'that'), (2, 'for'),
(3, 'A'), (3, 'An'), (3, 'Some'), (3, 'Any'), (3, 'One'), (3, 'And'), (3, 'To'), (3, 'In'), (3, 'Is'), (3, 'Of'),
(4, 'a'), (4, 'an'), (4, 'some'), (4, 'any'), (4, 'at'), (4, 'on'), (4, 'by'), (4, 'with'), (4, 'to'), (4, 'of'),
(5, 'a'), (5, 'an'), (5, 'some'), (5, 'any'), (5, 'at'), (5, 'on'), (5, 'by'), (5, 'with'), (5, 'to'), (5, 'of'),
(6, 'a'), (6, 'an'), (6, 'some'), (6, 'any'), (6, 'at'), (6, 'on'), (6, 'by'), (6, 'with'), (6, 'to'), (6, 'of'),
(7, 'A'), (7, 'An'), (7, 'Some'), (7, 'Any'), (7, 'One'), (7, 'And'), (7, 'To'), (7, 'In'), (7, 'Is'), (7, 'Of'),
(8, 'a'), (8, 'an'), (8, 'some'), (8, 'any'), (8, 'at'), (8, 'on'), (8, 'by'), (8, 'with'), (8, 'to'), (8, 'of');

-- =============================================================================
-- WORD 2: be
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (2, 'be', 'يكون', 'verb', 'To exist or live; used to describe states.', 'أن يوجد أو يعيش؛ يستخدم لوصف الحالات.', 'يكون', '["يوجد", "أكون"]', '{"base": "be", "present_am": "am", "present_is": "is", "present_are": "are", "past_was": "was", "past_were": "were", "participle": "been", "gerund": "being"}', '/biː/', 'be.mp3', '{"synonyms": ["exist"], "antonyms": [], "word_family": ["being"]}', 'The most irregular verb in English.', 'Beginner', 2);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(2, 'I want to {be} a doctor.', 'أريد أن أكون طبيباً.', 'be', 'Career', 'Easy', 1, 1),
(2, 'She {is} very happy today.', 'هي سعيدة جداً اليوم.', 'is', 'Emotion', 'Easy', 0, 2),
(2, 'They {are} at school.', 'هم في المدرسة.', 'are', 'Location', 'Easy', 0, 3),
(2, 'I {am} a student.', 'أنا طالب.', 'am', 'Identity', 'Easy', 0, 4),
(2, 'We {were} tired after the trip.', 'كنا متعبين بعد الرحلة.', 'were', 'State', 'Easy', 0, 5),
(2, 'It has {been} a long day.', 'لقد كان يوماً طويلاً.', 'been', 'Time', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(2, 'translation_match', 'easy', 'be', 'en', 'يكون', 'be', NULL, NULL, NULL, '"be" is the base form of the verb to exist.'),
(2, 'reverse_translation', 'easy', 'يكون', 'ar', 'be', 'be', NULL, NULL, NULL, 'The Arabic verb "يكون" corresponds to "be".'),
(2, 'sentence_completion', 'easy', 'I ___ a teacher.', 'en', 'am', 'present_am', 'I ___ a teacher.', 'I am a teacher.', 1, 'Use "am" with the pronoun "I".'),
(2, 'sentence_completion', 'easy', 'He ___ my friend.', 'en', 'is', 'present_is', 'He ___ my friend.', 'He is my friend.', 1, 'Use "is" with third-person singular.'),
(2, 'sentence_completion', 'easy', 'They ___ very kind.', 'en', 'are', 'present_are', 'They ___ very kind.', 'They are very kind.', 1, 'Use "are" with plural subjects.'),
(2, 'sentence_completion', 'easy', 'Yesterday, I ___ sick.', 'en', 'was', 'past_was', 'Yesterday, I ___ sick.', 'Yesterday, I was sick.', 2, 'Use "was" for past tense singular.'),
(2, 'sentence_completion', 'easy', 'We ___ late for the meeting.', 'en', 'were', 'past_were', 'We ___ late for the meeting.', 'We were late for the meeting.', 1, 'Use "were" for past tense plural.'),
(2, 'sentence_completion', 'easy', 'I have ___ there before.', 'en', 'been', 'participle', 'I have ___ there before.', 'I have been there before.', 2, 'Use "been" as the past participle.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(9, 'يفعل'), (9, 'يذهب'), (9, 'يأكل'), (9, 'يشرب'), (9, 'يرى'), (9, 'يملك'), (9, 'يقول'), (9, 'يأخذ'), (9, 'يعطي'), (9, 'يأتي'),
(10, 'do'), (10, 'have'), (10, 'go'), (10, 'see'), (10, 'take'), (10, 'give'), (10, 'come'), (10, 'make'), (10, 'say'), (10, 'get'),
(11, 'is'), (11, 'are'), (11, 'be'), (11, 'was'), (11, 'were'), (11, 'been'), (11, 'being'), (11, 'do'), (11, 'have'), (11, 'has'),
(12, 'am'), (12, 'are'), (12, 'be'), (12, 'was'), (12, 'were'), (12, 'been'), (12, 'being'), (12, 'do'), (12, 'have'), (12, 'has'),
(13, 'am'), (13, 'is'), (13, 'be'), (13, 'was'), (13, 'were'), (13, 'been'), (13, 'being'), (13, 'do'), (13, 'have'), (13, 'has'),
(14, 'am'), (14, 'is'), (14, 'are'), (14, 'be'), (14, 'were'), (14, 'been'), (14, 'being'), (14, 'do'), (14, 'have'), (14, 'has'),
(15, 'am'), (15, 'is'), (15, 'are'), (15, 'be'), (15, 'was'), (15, 'been'), (15, 'being'), (15, 'do'), (15, 'have'), (15, 'has'),
(16, 'am'), (16, 'is'), (16, 'are'), (16, 'be'), (16, 'was'), (16, 'were'), (16, 'being'), (16, 'do'), (16, 'have'), (16, 'has');

-- =============================================================================
-- WORD 3: to
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (3, 'to', 'إلى', 'preposition', 'Expressing motion in the direction of a particular location.', 'التعبير عن الحركة في اتجاه موقع معين.', 'إلى', '["لـ", "أن"]', '{"base": "to"}', '/tuː/', 'to.mp3', '{"synonyms": ["towards"], "antonyms": ["from"], "word_family": []}', 'Used both as a preposition and as part of an infinitive verb.', 'Beginner', 3);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(3, 'I am going {to} school.', 'أنا ذاهب إلى المدرسة.', 'to', 'Education', 'Easy', 1, 1),
(3, 'He traveled {to} London.', 'سافر إلى لندن.', 'to', 'Travel', 'Easy', 0, 2),
(3, 'Please talk {to} me.', 'من فضلك تحدث إلي.', 'to', 'Communication', 'Easy', 0, 3),
(3, 'I want {to} eat.', 'أريد أن آكل.', 'to', 'Needs', 'Easy', 0, 4),
(3, 'Give it {to} her.', 'أعطها إياها.', 'to', 'Giving', 'Easy', 0, 5),
(3, 'Welcome {to} our home.', 'مرحباً بكم في منزلنا.', 'to', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(3, 'translation_match', 'easy', 'to', 'en', 'إلى', 'to', NULL, NULL, NULL, '"to" is a preposition indicating direction.'),
(3, 'reverse_translation', 'easy', 'إلى', 'ar', 'to', 'to', NULL, NULL, NULL, 'The Arabic "إلى" translates to "to" in English.'),
(3, 'sentence_completion', 'easy', 'Go ___ the door.', 'en', 'to', 'to', 'Go ___ the door.', 'Go to the door.', 1, 'Use "to" to indicate direction.'),
(3, 'sentence_completion', 'easy', 'I like ___ swim.', 'en', 'to', 'to', 'I like ___ swim.', 'I like to swim.', 2, 'Use "to" before the base form of a verb (infinitive).'),
(3, 'sentence_completion', 'easy', 'Listen ___ the music.', 'en', 'to', 'to', 'Listen ___ the music.', 'Listen to the music.', 1, 'The verb "listen" is followed by "to".'),
(3, 'sentence_completion', 'easy', 'Send it ___ him.', 'en', 'to', 'to', 'Send it ___ him.', 'Send it to him.', 2, 'Use "to" to indicate the recipient.'),
(3, 'sentence_completion', 'easy', 'Back ___ work.', 'en', 'to', 'to', 'Back ___ work.', 'Back to work.', 1, 'Use "to" with "back" to indicate returning.'),
(3, 'sentence_completion', 'easy', 'Happy birthday ___ you.', 'en', 'to', 'to', 'Happy birthday ___ you.', 'Happy birthday to you.', 2, 'Common phrase using "to".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(17, 'من'), (17, 'في'), (17, 'على'), (17, 'عن'), (17, 'مع'), (17, 'بـ'), (17, 'لـ'), (17, 'أو'), (17, 'لكن'), (17, 'إذا'),
(18, 'from'), (18, 'in'), (18, 'on'), (18, 'at'), (18, 'by'), (18, 'with'), (18, 'for'), (18, 'of'), (18, 'and'), (18, 'but'),
(19, 'from'), (19, 'in'), (19, 'on'), (19, 'at'), (19, 'by'), (19, 'with'), (19, 'for'), (19, 'of'), (19, 'and'), (19, 'but'),
(20, 'from'), (20, 'in'), (20, 'on'), (20, 'at'), (20, 'by'), (20, 'with'), (20, 'for'), (20, 'of'), (20, 'and'), (20, 'but'),
(21, 'from'), (21, 'in'), (21, 'on'), (21, 'at'), (21, 'by'), (21, 'with'), (21, 'for'), (21, 'of'), (21, 'and'), (21, 'but'),
(22, 'from'), (22, 'in'), (22, 'on'), (22, 'at'), (22, 'by'), (22, 'with'), (22, 'for'), (22, 'of'), (22, 'and'), (22, 'but'),
(23, 'from'), (23, 'in'), (23, 'on'), (23, 'at'), (23, 'by'), (23, 'with'), (23, 'for'), (23, 'of'), (23, 'and'), (23, 'but'),
(24, 'from'), (24, 'in'), (24, 'on'), (24, 'at'), (24, 'by'), (24, 'with'), (24, 'for'), (24, 'of'), (24, 'and'), (24, 'but');

-- =============================================================================
-- WORD 4: of
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (4, 'of', 'من', 'preposition', 'Expressing the relationship between a part and a whole.', 'التعبير عن العلاقة بين الجزء والكل.', 'من', '["الخاص بـ", "عن"]', '{"base": "of"}', '/ɒv/', 'of.mp3', '{"synonyms": [], "antonyms": [], "word_family": []}', 'Often used to show possession or belonging.', 'Beginner', 4);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(4, 'A glass {of} water.', 'كوب من الماء.', 'of', 'Food', 'Easy', 1, 1),
(4, 'The city {of} London.', 'مدينة لندن.', 'of', 'Geography', 'Easy', 0, 2),
(4, 'The end {of} the day.', 'نهاية اليوم.', 'of', 'Time', 'Easy', 0, 3),
(4, 'A piece {of} cake.', 'قطعة من الكعك.', 'of', 'Food', 'Easy', 0, 4),
(4, 'A member {of} the team.', 'عضو في الفريق.', 'of', 'Work', 'Easy', 0, 5),
(4, 'A sense {of} humor.', 'حس دعابة.', 'of', 'Personality', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(4, 'translation_match', 'easy', 'of', 'en', 'من', 'of', NULL, NULL, NULL, '"of" often translates to "من" when indicating parts of a whole.'),
(4, 'reverse_translation', 'easy', 'من', 'ar', 'of', 'of', NULL, NULL, NULL, 'The Arabic "من" can translate to "of" in many contexts.'),
(4, 'sentence_completion', 'easy', 'A cup ___ tea.', 'en', 'of', 'of', 'A cup ___ tea.', 'A cup of tea.', 2, 'Use "of" to connect a container and its contents.'),
(4, 'sentence_completion', 'easy', 'The King ___ Jordan.', 'en', 'of', 'of', 'The King ___ Jordan.', 'The King of Jordan.', 2, 'Use "of" to show titles or belonging.'),
(4, 'sentence_completion', 'easy', 'Part ___ the plan.', 'en', 'of', 'of', 'Part ___ the plan.', 'Part of the plan.', 1, 'Use "of" to show a part of a whole.'),
(4, 'sentence_completion', 'easy', 'Get out ___ here.', 'en', 'of', 'of', 'Get out ___ here.', 'Get out of here.', 2, 'Common phrasal usage.'),
(4, 'sentence_completion', 'easy', 'Because ___ you.', 'en', 'of', 'of', 'Because ___ you.', 'Because of you.', 1, 'The phrase "because of" indicates reason.'),
(4, 'sentence_completion', 'easy', 'Instead ___ that.', 'en', 'of', 'of', 'Instead ___ that.', 'Instead of that.', 1, 'The phrase "instead of" indicates substitution.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(25, 'إلى'), (25, 'في'), (25, 'على'), (25, 'عن'), (25, 'مع'), (25, 'بـ'), (25, 'لـ'), (25, 'أو'), (25, 'لكن'), (25, 'إذا'),
(26, 'to'), (26, 'in'), (26, 'on'), (26, 'at'), (26, 'by'), (26, 'with'), (26, 'for'), (26, 'from'), (26, 'and'), (26, 'but'),
(27, 'to'), (27, 'in'), (27, 'on'), (27, 'at'), (27, 'by'), (27, 'with'), (27, 'for'), (27, 'from'), (27, 'and'), (27, 'but'),
(28, 'to'), (28, 'in'), (28, 'on'), (28, 'at'), (28, 'by'), (28, 'with'), (28, 'for'), (28, 'from'), (28, 'and'), (28, 'but'),
(29, 'to'), (29, 'in'), (29, 'on'), (29, 'at'), (29, 'by'), (29, 'with'), (29, 'for'), (29, 'from'), (29, 'and'), (29, 'but'),
(30, 'to'), (30, 'in'), (30, 'on'), (30, 'at'), (30, 'by'), (30, 'with'), (30, 'for'), (30, 'from'), (30, 'and'), (30, 'but'),
(31, 'to'), (31, 'in'), (31, 'on'), (31, 'at'), (31, 'by'), (31, 'with'), (31, 'for'), (31, 'from'), (31, 'and'), (31, 'but'),
(32, 'to'), (32, 'in'), (32, 'on'), (32, 'at'), (32, 'by'), (32, 'with'), (32, 'for'), (32, 'from'), (32, 'and'), (32, 'but');

-- =============================================================================
-- WORD 5: and
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (5, 'and', 'و', 'conjunction', 'Used to connect words, clauses, or sentences.', 'تستخدم لربط الكلمات أو العبارات أو الجمل.', 'و', '[]', '{"base": "and"}', '/ænd/', 'and.mp3', '{"synonyms": ["plus", "also"], "antonyms": [], "word_family": []}', 'The primary conjunction for joining items in a list.', 'Beginner', 5);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(5, 'Salt {and} pepper.', 'ملح وفلفل.', 'and', 'Food', 'Easy', 1, 1),
(5, 'You {and} I are friends.', 'أنت وأنا صديقان.', 'and', 'Social', 'Easy', 0, 2),
(5, 'Black {and} white.', 'أسود وأبيض.', 'and', 'Colors', 'Easy', 0, 3),
(5, 'Bread {and} butter.', 'خبز وزبدة.', 'and', 'Food', 'Easy', 0, 4),
(5, 'Cats {and} dogs.', 'قطط وكلاب.', 'and', 'Animals', 'Easy', 0, 5),
(5, 'Up {and} down.', 'فوق وتحت.', 'and', 'Direction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(5, 'translation_match', 'easy', 'and', 'en', 'و', 'and', NULL, NULL, NULL, '"and" is the English conjunction for "و".'),
(5, 'reverse_translation', 'easy', 'و', 'ar', 'and', 'and', NULL, NULL, NULL, 'The Arabic letter "و" translates to "and".'),
(5, 'sentence_completion', 'easy', 'Bread ___ butter.', 'en', 'and', 'and', 'Bread ___ butter.', 'Bread and butter.', 1, 'Use "and" to join two food items.'),
(5, 'sentence_completion', 'easy', 'You ___ me.', 'en', 'and', 'and', 'You ___ me.', 'You and me.', 1, 'Use "and" to join pronouns.'),
(5, 'sentence_completion', 'easy', 'Red ___ blue.', 'en', 'and', 'and', 'Red ___ blue.', 'Red and blue.', 1, 'Use "and" to join colors.'),
(5, 'sentence_completion', 'easy', 'Fast ___ slow.', 'en', 'and', 'and', 'Fast ___ slow.', 'Fast and slow.', 1, 'Use "and" to join opposites.'),
(5, 'sentence_completion', 'easy', 'Come ___ see.', 'en', 'and', 'and', 'Come ___ see.', 'Come and see.', 1, 'Use "and" to join two verbs.'),
(5, 'sentence_completion', 'easy', 'Boy ___ girl.', 'en', 'and', 'and', 'Boy ___ girl.', 'Boy and girl.', 1, 'Use "and" to join nouns.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(33, 'أو'), (33, 'لكن'), (33, 'إذا'), (33, 'من'), (33, 'إلى'), (33, 'في'), (33, 'على'), (33, 'عن'), (33, 'مع'), (33, 'بـ'),
(34, 'or'), (34, 'but'), (34, 'if'), (34, 'so'), (34, 'yet'), (34, 'for'), (34, 'nor'), (34, 'with'), (34, 'to'), (34, 'of'),
(35, 'or'), (35, 'but'), (35, 'if'), (35, 'so'), (35, 'yet'), (35, 'for'), (35, 'nor'), (35, 'with'), (35, 'to'), (35, 'of'),
(36, 'or'), (36, 'but'), (36, 'if'), (36, 'so'), (36, 'yet'), (36, 'for'), (36, 'nor'), (36, 'with'), (36, 'to'), (36, 'of'),
(37, 'or'), (37, 'but'), (37, 'if'), (37, 'so'), (37, 'yet'), (37, 'for'), (37, 'nor'), (37, 'with'), (37, 'to'), (37, 'of'),
(38, 'or'), (38, 'but'), (38, 'if'), (38, 'so'), (38, 'yet'), (38, 'for'), (38, 'nor'), (38, 'with'), (38, 'to'), (38, 'of'),
(39, 'or'), (39, 'but'), (39, 'if'), (39, 'so'), (39, 'yet'), (39, 'for'), (39, 'nor'), (39, 'with'), (39, 'to'), (39, 'of'),
(40, 'or'), (40, 'but'), (40, 'if'), (40, 'so'), (40, 'yet'), (40, 'for'), (40, 'nor'), (40, 'with'), (40, 'to'), (40, 'of');

-- =============================================================================
-- WORD 6: a
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (6, 'a', 'أداة نكرة', 'article', 'Used before a singular noun that is not specific.', 'تستخدم قبل الاسم المفرد غير المحدد.', 'أداة نكرة', '[]', '{"singular": "a"}', '/ə/', 'a.mp3', '{"synonyms": ["one"], "antonyms": ["the"], "word_family": []}', 'Used before words starting with a consonant sound.', 'Beginner', 6);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(6, 'I have {a} car.', 'لدي سيارة.', 'a', 'Possession', 'Easy', 1, 1),
(6, 'She is {a} doctor.', 'هي طبيبة.', 'a', 'Jobs', 'Easy', 0, 2),
(6, 'He saw {a} bird.', 'رأى طائراً.', 'a', 'Nature', 'Easy', 0, 3),
(6, 'Give me {a} pen.', 'أعطني قلماً.', 'a', 'Requests', 'Easy', 0, 4),
(6, 'This is {a} big house.', 'هذا منزل كبير.', 'a', 'Description', 'Easy', 0, 5),
(6, 'I need {a} break.', 'أحتاج إلى استراحة.', 'a', 'Needs', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(6, 'translation_match', 'easy', 'a', 'en', 'أداة نكرة', 'a', NULL, NULL, NULL, '"a" is the indefinite article used before consonant sounds.'),
(6, 'reverse_translation', 'easy', 'أداة نكرة', 'ar', 'a', 'a', NULL, NULL, NULL, 'The English indefinite article is "a".'),
(6, 'sentence_completion', 'easy', 'I am ___ student.', 'en', 'a', 'singular', 'I am ___ student.', 'I am a student.', 2, 'Use "a" before a singular noun starting with a consonant.'),
(6, 'sentence_completion', 'easy', 'She has ___ cat.', 'en', 'a', 'singular', 'She has ___ cat.', 'She has a cat.', 2, 'Use "a" for a non-specific singular noun.'),
(6, 'sentence_completion', 'easy', 'This is ___ book.', 'en', 'a', 'singular', 'This is ___ book.', 'This is a book.', 2, 'Use "a" to identify a singular object.'),
(6, 'sentence_completion', 'easy', 'He is ___ good man.', 'en', 'a', 'singular', 'He is ___ good man.', 'He is a good man.', 2, 'Use "a" before an adjective-noun phrase.'),
(6, 'sentence_completion', 'easy', 'I want ___ apple.', 'en', 'an', 'singular', 'I want ___ apple.', 'I want an apple.', 2, 'Note: "an" is used before vowel sounds (distractor check).'),
(6, 'sentence_completion', 'easy', 'Wait ___ minute.', 'en', 'a', 'singular', 'Wait ___ minute.', 'Wait a minute.', 1, 'Common expression using "a".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(41, 'الـ'), (41, 'في'), (41, 'من'), (41, 'إلى'), (41, 'و'), (41, 'هو'), (41, 'أنا'), (41, 'هذا'), (41, 'لا'), (41, 'على'),
(42, 'the'), (42, 'an'), (42, 'some'), (42, 'any'), (42, 'and'), (42, 'of'), (42, 'to'), (42, 'in'), (42, 'is'), (42, 'it'),
(43, 'the'), (43, 'an'), (43, 'some'), (43, 'any'), (43, 'one'), (43, 'and'), (43, 'to'), (43, 'in'), (43, 'is'), (43, 'of'),
(44, 'the'), (44, 'an'), (44, 'some'), (44, 'any'), (44, 'one'), (44, 'and'), (44, 'to'), (44, 'in'), (44, 'is'), (44, 'of'),
(45, 'the'), (45, 'an'), (45, 'some'), (45, 'any'), (45, 'one'), (45, 'and'), (45, 'to'), (45, 'in'), (45, 'is'), (45, 'of'),
(46, 'the'), (46, 'an'), (46, 'some'), (46, 'any'), (46, 'one'), (46, 'and'), (46, 'to'), (46, 'in'), (46, 'is'), (46, 'of'),
(47, 'a'), (47, 'the'), (47, 'some'), (47, 'any'), (47, 'one'), (47, 'and'), (47, 'to'), (47, 'in'), (47, 'is'), (47, 'of'),
(48, 'the'), (48, 'an'), (48, 'some'), (48, 'any'), (48, 'one'), (48, 'and'), (48, 'to'), (48, 'in'), (48, 'is'), (48, 'of');

-- =============================================================================
-- WORD 7: in
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (7, 'in', 'في', 'preposition', 'Expressing the situation of something that is or appears to be enclosed or surrounded by something else.', 'التعبير عن حالة شيء موجود داخل أو محاط بشيء آخر.', 'في', '["داخل"]', '{"base": "in"}', '/ɪn/', 'in.mp3', '{"synonyms": ["inside"], "antonyms": ["out", "outside"], "word_family": []}', 'Used for locations, months, and years.', 'Beginner', 7);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(7, 'The keys are {in} the bag.', 'المفاتيح في الحقيبة.', 'in', 'Home', 'Easy', 1, 1),
(7, 'I live {in} Cairo.', 'أنا أعيش في القاهرة.', 'in', 'Location', 'Easy', 0, 2),
(7, 'It is cold {in} winter.', 'الجو بارد في الشتاء.', 'in', 'Weather', 'Easy', 0, 3),
(7, 'She is {in} the kitchen.', 'هي في المطبخ.', 'in', 'Home', 'Easy', 0, 4),
(7, 'I was born {in} 1995.', 'ولدت في عام 1995.', 'in', 'Time', 'Easy', 0, 5),
(7, 'Put it {in} the box.', 'ضعه في الصندوق.', 'in', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(7, 'translation_match', 'easy', 'in', 'en', 'في', 'in', NULL, NULL, NULL, '"in" is the primary preposition for "في".'),
(7, 'reverse_translation', 'easy', 'في', 'ar', 'in', 'in', NULL, NULL, NULL, 'The Arabic "في" translates to "in" in English.'),
(7, 'sentence_completion', 'easy', 'The milk is ___ the fridge.', 'en', 'in', 'base', 'The milk is ___ the fridge.', 'The milk is in the fridge.', 3, 'Use "in" for items inside a container.'),
(7, 'sentence_completion', 'easy', 'We are ___ the car.', 'en', 'in', 'base', 'We are ___ the car.', 'We are in the car.', 2, 'Use "in" for being inside a vehicle.'),
(7, 'sentence_completion', 'easy', 'I will see you ___ June.', 'en', 'in', 'base', 'I will see you ___ June.', 'I will see you in June.', 4, 'Use "in" before months.'),
(7, 'sentence_completion', 'easy', 'He is ___ the office.', 'en', 'in', 'base', 'He is ___ the office.', 'He is in the office.', 2, 'Use "in" for locations.'),
(7, 'sentence_completion', 'easy', 'The book is ___ my hand.', 'en', 'in', 'base', 'The book is ___ my hand.', 'The book is in my hand.', 3, 'Use "in" for things held within something.'),
(7, 'sentence_completion', 'easy', 'I live ___ a city.', 'en', 'in', 'base', 'I live ___ a city.', 'I live in a city.', 2, 'Use "in" for living in a place.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(49, 'على'), (49, 'من'), (49, 'إلى'), (49, 'عن'), (49, 'مع'), (49, 'بـ'), (49, 'لـ'), (49, 'أو'), (49, 'لكن'), (49, 'إذا'),
(50, 'on'), (50, 'at'), (50, 'to'), (50, 'from'), (50, 'by'), (50, 'with'), (50, 'for'), (50, 'of'), (50, 'and'), (50, 'but'),
(51, 'on'), (51, 'at'), (51, 'to'), (51, 'from'), (51, 'by'), (51, 'with'), (51, 'for'), (51, 'of'), (51, 'and'), (51, 'but'),
(52, 'on'), (52, 'at'), (52, 'to'), (52, 'from'), (52, 'by'), (52, 'with'), (52, 'for'), (52, 'of'), (52, 'and'), (52, 'but'),
(53, 'on'), (53, 'at'), (53, 'to'), (53, 'from'), (53, 'by'), (53, 'with'), (53, 'for'), (53, 'of'), (53, 'and'), (53, 'but'),
(54, 'on'), (54, 'at'), (54, 'to'), (54, 'from'), (54, 'by'), (54, 'with'), (54, 'for'), (54, 'of'), (54, 'and'), (54, 'but'),
(55, 'on'), (55, 'at'), (55, 'to'), (55, 'from'), (55, 'by'), (55, 'with'), (55, 'for'), (55, 'of'), (55, 'and'), (55, 'but'),
(56, 'on'), (56, 'at'), (56, 'to'), (56, 'from'), (56, 'by'), (56, 'with'), (56, 'for'), (56, 'of'), (56, 'and'), (56, 'but');

-- =============================================================================
-- WORD 8: that
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (8, 'that', 'ذلك', 'pronoun', 'Used to identify a specific person or thing observed by the speaker.', 'يستخدم لتحديد شخص أو شيء معين يلاحظه المتحدث.', 'ذلك', '["تلك", "أن", "الذي"]', '{"singular": "that", "plural": "those"}', '/ðæt/', 'that.mp3', '{"synonyms": ["this"], "antonyms": ["this"], "word_family": []}', 'Can be a demonstrative pronoun or a conjunction.', 'Beginner', 8);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(8, 'Look at {that} bird.', 'انظر إلى ذلك الطائر.', 'that', 'Nature', 'Easy', 1, 1),
(8, 'I know {that} you are tired.', 'أعرف أنك متعب.', 'that', 'Emotion', 'Easy', 0, 2),
(8, 'What is {that}?', 'ما هذا؟ (للبعيد)', 'that', 'General', 'Easy', 0, 3),
(8, '{That} is my car.', 'تلك سيارتي.', 'that', 'Possession', 'Easy', 0, 4),
(8, 'I like {that} color.', 'يعجبني ذلك اللون.', 'that', 'Colors', 'Easy', 0, 5),
(8, 'He said {that} he was busy.', 'قال إنه كان مشغولاً.', 'that', 'Communication', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(8, 'translation_match', 'easy', 'that', 'en', 'ذلك', 'singular', NULL, NULL, NULL, '"that" is used for singular objects at a distance.'),
(8, 'reverse_translation', 'easy', 'ذلك', 'ar', 'that', 'singular', NULL, NULL, NULL, 'The Arabic "ذلك" translates to "that".'),
(8, 'sentence_completion', 'easy', '___ is a beautiful house.', 'en', 'That', 'singular', '___ is a beautiful house.', 'That is a beautiful house.', 0, 'Use "That" to point to a singular object.'),
(8, 'sentence_completion', 'easy', 'I think ___ it will rain.', 'en', 'that', 'conjunction', 'I think ___ it will rain.', 'I think that it will rain.', 2, 'Use "that" as a conjunction to connect clauses.'),
(8, 'sentence_completion', 'easy', 'Who is ___ man?', 'en', 'that', 'singular', 'Who is ___ man?', 'Who is that man?', 2, 'Use "that" to refer to a specific person.'),
(8, 'sentence_completion', 'easy', 'I want ___ one.', 'en', 'that', 'singular', 'I want ___ one.', 'I want that one.', 2, 'Use "that" to specify a choice.'),
(8, 'sentence_completion', 'easy', 'She said ___ she was happy.', 'en', 'that', 'conjunction', 'She said ___ she was happy.', 'She said that she was happy.', 2, 'Use "that" to report what someone said.'),
(8, 'sentence_completion', 'easy', '___ was a great movie.', 'en', 'That', 'singular', '___ was a great movie.', 'That was a great movie.', 0, 'Use "That" to refer to a past event or object.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(57, 'هذا'), (57, 'هؤلاء'), (57, 'هنا'), (57, 'هناك'), (57, 'من'), (57, 'إلى'), (57, 'في'), (57, 'و'), (57, 'لا'), (57, 'أنا'),
(58, 'this'), (58, 'these'), (58, 'those'), (58, 'there'), (58, 'here'), (58, 'then'), (58, 'than'), (58, 'the'), (58, 'they'), (58, 'their'),
(59, 'This'), (59, 'These'), (59, 'Those'), (59, 'There'), (59, 'Here'), (59, 'Then'), (59, 'Than'), (59, 'The'), (59, 'They'), (59, 'Their'),
(60, 'this'), (60, 'these'), (60, 'those'), (60, 'there'), (60, 'here'), (60, 'then'), (60, 'than'), (60, 'the'), (60, 'they'), (60, 'their'),
(61, 'this'), (61, 'these'), (61, 'those'), (61, 'there'), (61, 'here'), (61, 'then'), (61, 'than'), (61, 'the'), (61, 'they'), (61, 'their'),
(62, 'this'), (62, 'these'), (62, 'those'), (62, 'there'), (62, 'here'), (62, 'then'), (62, 'than'), (62, 'the'), (62, 'they'), (62, 'their'),
(63, 'this'), (63, 'these'), (63, 'those'), (63, 'there'), (63, 'here'), (63, 'then'), (63, 'than'), (63, 'the'), (63, 'they'), (63, 'their'),
(64, 'This'), (64, 'These'), (64, 'Those'), (64, 'There'), (64, 'Here'), (64, 'Then'), (64, 'Than'), (64, 'The'), (64, 'They'), (64, 'Their');

-- =============================================================================
-- WORD 9: have
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (9, 'have', 'يملك', 'verb', 'To possess, own, or hold.', 'أن يمتلك، يملك، أو يحوز.', 'يملك', '["لديه", "عنده", "يتناول"]', '{"base": "have", "thirdPerson": "has", "past": "had", "participle": "had", "gerund": "having"}', '/hæv/', 'have.mp3', '{"synonyms": ["possess", "own"], "antonyms": ["lack", "lose"], "word_family": []}', 'Also used as an auxiliary verb in perfect tenses.', 'Beginner', 9);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(9, 'I {have} a pen.', 'لدي قلم.', 'have', 'Possession', 'Easy', 1, 1),
(9, 'She {has} a cat.', 'هي تملك قطة.', 'has', 'Animals', 'Easy', 0, 2),
(9, 'We {had} lunch at noon.', 'تناولنا الغداء ظهراً.', 'had', 'Food', 'Easy', 0, 3),
(9, 'I am {having} a good time.', 'أنا أقضي وقتاً ممتعاً.', 'having', 'Emotion', 'Easy', 0, 4),
(9, 'They {have} three children.', 'لديهم ثلاثة أطفال.', 'have', 'Family', 'Easy', 0, 5),
(9, 'He {has} to go now.', 'يجب عليه الذهاب الآن.', 'has', 'Obligation', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(9, 'translation_match', 'easy', 'have', 'en', 'يملك', 'base', NULL, NULL, NULL, '"have" is the base form for possession.'),
(9, 'reverse_translation', 'easy', 'يملك', 'ar', 'have', 'base', NULL, NULL, NULL, 'The Arabic "يملك" translates to "have".'),
(9, 'sentence_completion', 'easy', 'I ___ a big family.', 'en', 'have', 'base', 'I ___ a big family.', 'I have a big family.', 1, 'Use "have" with the pronoun "I".'),
(9, 'sentence_completion', 'easy', 'She ___ a blue car.', 'en', 'has', 'thirdPerson', 'She ___ a blue car.', 'She has a blue car.', 1, 'Use "has" for third-person singular.'),
(9, 'sentence_completion', 'easy', 'We ___ a meeting yesterday.', 'en', 'had', 'past', 'We ___ a meeting yesterday.', 'We had a meeting yesterday.', 1, 'Use "had" for past tense.'),
(9, 'sentence_completion', 'easy', 'They ___ many friends.', 'en', 'have', 'base', 'They ___ many friends.', 'They have many friends.', 1, 'Use "have" for plural subjects.'),
(9, 'sentence_completion', 'easy', 'He ___ finished his work.', 'en', 'has', 'thirdPerson', 'He ___ finished his work.', 'He has finished his work.', 1, 'Use "has" as an auxiliary verb for "he".'),
(9, 'sentence_completion', 'easy', 'I am ___ dinner now.', 'en', 'having', 'gerund', 'I am ___ dinner now.', 'I am having dinner now.', 2, 'Use "having" for continuous actions.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(65, 'يفعل'), (65, 'يذهب'), (65, 'يأكل'), (65, 'يرى'), (65, 'يأخذ'), (65, 'يعطي'), (65, 'يقول'), (65, 'يأتي'), (65, 'يكون'), (65, 'يصنع'),
(66, 'do'), (66, 'go'), (66, 'see'), (66, 'take'), (66, 'give'), (66, 'say'), (66, 'come'), (66, 'be'), (66, 'make'), (66, 'get'),
(67, 'has'), (67, 'had'), (67, 'having'), (67, 'do'), (67, 'does'), (67, 'did'), (67, 'be'), (67, 'is'), (67, 'am'), (67, 'are'),
(68, 'have'), (68, 'had'), (68, 'having'), (68, 'do'), (68, 'does'), (68, 'did'), (68, 'be'), (68, 'is'), (68, 'am'), (68, 'are'),
(69, 'have'), (69, 'has'), (69, 'having'), (69, 'do'), (69, 'does'), (69, 'did'), (69, 'be'), (69, 'is'), (69, 'am'), (69, 'are'),
(70, 'has'), (70, 'had'), (70, 'having'), (70, 'do'), (70, 'does'), (70, 'did'), (70, 'be'), (70, 'is'), (70, 'am'), (70, 'are'),
(71, 'have'), (71, 'had'), (71, 'having'), (71, 'do'), (71, 'does'), (71, 'did'), (71, 'be'), (71, 'is'), (71, 'am'), (71, 'are'),
(72, 'have'), (72, 'has'), (72, 'had'), (72, 'do'), (72, 'does'), (72, 'did'), (72, 'be'), (72, 'is'), (72, 'am'), (72, 'are');

-- =============================================================================
-- WORD 10: I
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (10, 'I', 'أنا', 'pronoun', 'Used by a speaker to refer to himself or herself.', 'يستخدمه المتحدث للإشارة إلى نفسه.', 'أنا', '[]', '{"subject": "I", "object": "me", "possessive": "my", "possessive_pronoun": "mine", "reflexive": "myself"}', '/aɪ/', 'i.mp3', '{"synonyms": [], "antonyms": [], "word_family": []}', 'Always capitalized in English.', 'Beginner', 10);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(10, '{I} am happy.', 'أنا سعيد.', 'I', 'Emotion', 'Easy', 1, 1),
(10, 'He saw {me}.', 'رآني.', 'me', 'Social', 'Easy', 0, 2),
(10, 'This is {my} book.', 'هذا كتابي.', 'my', 'Possession', 'Easy', 0, 3),
(10, 'That pen is {mine}.', 'ذلك القلم لي.', 'mine', 'Possession', 'Easy', 0, 4),
(10, 'I did it {myself}.', 'فعلت ذلك بنفسي.', 'myself', 'Action', 'Easy', 0, 5),
(10, '{I} like coffee.', 'أنا أحب القهوة.', 'I', 'Preferences', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(10, 'translation_match', 'easy', 'I', 'en', 'أنا', 'subject', NULL, NULL, NULL, '"I" is the first-person singular subject pronoun.'),
(10, 'reverse_translation', 'easy', 'أنا', 'ar', 'I', 'subject', NULL, NULL, NULL, 'The Arabic "أنا" translates to "I".'),
(10, 'sentence_completion', 'easy', '___ am a student.', 'en', 'I', 'subject', '___ am a student.', 'I am a student.', 0, 'Use "I" as the subject before "am".'),
(10, 'sentence_completion', 'easy', 'Can you help ___?', 'en', 'me', 'object', 'Can you help ___?', 'Can you help me?', 3, 'Use "me" as the object of the verb.'),
(10, 'sentence_completion', 'easy', '___ name is John.', 'en', 'My', 'possessive', '___ name is John.', 'My name is John.', 0, 'Use "My" to show possession.'),
(10, 'sentence_completion', 'easy', 'This car is ___.', 'en', 'mine', 'possessive_pronoun', 'This car is ___.', 'This car is mine.', 3, 'Use "mine" as a possessive pronoun.'),
(10, 'sentence_completion', 'easy', 'I saw ___ in the mirror.', 'en', 'myself', 'reflexive', 'I saw ___ in the mirror.', 'I saw myself in the mirror.', 2, 'Use "myself" when the subject and object are the same.'),
(10, 'sentence_completion', 'easy', '___ love music.', 'en', 'I', 'subject', '___ love music.', 'I love music.', 0, 'Use "I" as the subject pronoun.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(73, 'هو'), (73, 'هي'), (73, 'نحن'), (73, 'هم'), (73, 'أنت'), (73, 'هذا'), (73, 'ذلك'), (73, 'من'), (73, 'إلى'), (73, 'في'),
(74, 'you'), (74, 'he'), (74, 'she'), (74, 'it'), (74, 'we'), (74, 'they'), (74, 'my'), (74, 'me'), (74, 'mine'), (74, 'myself'),
(75, 'Me'), (75, 'My'), (75, 'Mine'), (75, 'Myself'), (75, 'You'), (75, 'He'), (75, 'She'), (75, 'It'), (75, 'We'), (75, 'They'),
(76, 'I'), (76, 'my'), (76, 'mine'), (76, 'myself'), (76, 'you'), (76, 'he'), (76, 'she'), (76, 'it'), (76, 'we'), (76, 'they'),
(77, 'I'), (77, 'me'), (77, 'mine'), (77, 'myself'), (77, 'you'), (77, 'he'), (77, 'she'), (77, 'it'), (77, 'we'), (77, 'they'),
(78, 'I'), (78, 'me'), (78, 'my'), (78, 'myself'), (78, 'you'), (78, 'he'), (78, 'she'), (78, 'it'), (78, 'we'), (78, 'they'),
(79, 'I'), (79, 'me'), (79, 'my'), (79, 'mine'), (79, 'you'), (79, 'he'), (79, 'she'), (79, 'it'), (79, 'we'), (79, 'they'),
(80, 'Me'), (80, 'My'), (80, 'Mine'), (80, 'Myself'), (80, 'You'), (80, 'He'), (80, 'She'), (80, 'It'), (80, 'We'), (80, 'They');

-- =============================================================================
-- WORD 11: it
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (11, 'it', 'هو/هي (لغير العاقل)', 'pronoun', 'Used to refer to a thing previously mentioned or easily identified.', 'يستخدم للإشارة إلى شيء ذكر سابقاً أو يمكن التعرف عليه بسهولة.', 'هو/هي (لغير العاقل)', '["هذا", "ذلك"]', '{"subject": "it", "object": "it", "possessive": "its", "reflexive": "itself"}', '/ɪt/', 'it.mp3', '{"synonyms": ["this", "that"], "antonyms": [], "word_family": []}', 'Used for animals, objects, and abstract ideas.', 'Beginner', 11);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(11, '{It} is a beautiful day.', 'إنه يوم جميل.', 'it', 'Weather', 'Easy', 1, 1),
(11, 'I like this book, I read {it} every day.', 'أحب هذا الكتاب، أقرأه كل يوم.', 'it', 'Hobbies', 'Easy', 0, 2),
(11, 'The cat licked {its} paw.', 'لعقت القطة مخلبها.', 'its', 'Animals', 'Easy', 0, 3),
(11, 'The door closed by {itself}.', 'أغلق الباب من تلقاء نفسه.', 'itself', 'Home', 'Easy', 0, 4),
(11, 'Give {it} to me.', 'أعطني إياه.', 'it', 'Requests', 'Easy', 0, 5),
(11, '{It} is raining outside.', 'إنها تمطر في الخارج.', 'it', 'Weather', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(11, 'translation_match', 'easy', 'it', 'en', 'هو/هي (لغير العاقل)', 'subject', NULL, NULL, NULL, '"it" is the neutral pronoun for objects and animals.'),
(11, 'reverse_translation', 'easy', 'هو/هي (لغير العاقل)', 'ar', 'it', 'subject', NULL, NULL, NULL, 'The English pronoun for non-human subjects is "it".'),
(11, 'sentence_completion', 'easy', '___ is very cold today.', 'en', 'It', 'subject', '___ is very cold today.', 'It is very cold today.', 0, 'Use "It" as a dummy subject for weather.'),
(11, 'sentence_completion', 'easy', 'I saw the movie and liked ___.', 'en', 'it', 'object', 'I saw the movie and liked ___.', 'I saw the movie and liked it.', 6, 'Use "it" as an object referring to the movie.'),
(11, 'sentence_completion', 'easy', 'The dog wagged ___ tail.', 'en', 'its', 'possessive', 'The dog wagged ___ tail.', 'The dog wagged its tail.', 3, 'Use "its" for possession by an animal.'),
(11, 'sentence_completion', 'easy', 'The computer turned ___ off.', 'en', 'itself', 'reflexive', 'The computer turned ___ off.', 'The computer turned itself off.', 3, 'Use "itself" when the object is the same as the subject.'),
(11, 'sentence_completion', 'easy', 'Where is my pen? I cannot find ___.', 'en', 'it', 'object', 'Where is my pen? I cannot find ___.', 'Where is my pen? I cannot find it.', 8, 'Use "it" to refer to the pen.'),
(11, 'sentence_completion', 'easy', '___ is time to go.', 'en', 'It', 'subject', '___ is time to go.', 'It is time to go.', 0, 'Use "It" to talk about time.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(81, 'أنا'), (81, 'أنت'), (81, 'نحن'), (81, 'هم'), (81, 'رجل'), (81, 'امرأة'), (81, 'ولد'), (81, 'بنت'), (81, 'كبير'), (81, 'صغير'),
(82, 'he'), (82, 'she'), (82, 'they'), (82, 'we'), (82, 'I'), (82, 'you'), (82, 'man'), (82, 'woman'), (82, 'this'), (82, 'that'),
(83, 'He'), (83, 'She'), (83, 'They'), (83, 'We'), (83, 'You'), (83, 'Its'), (83, 'Itself'), (83, 'Them'), (83, 'His'), (83, 'Her'),
(84, 'him'), (84, 'her'), (84, 'them'), (84, 'us'), (84, 'me'), (84, 'you'), (84, 'its'), (84, 'itself'), (84, 'his'), (84, 'hers'),
(85, 'it'), (85, 'it''s'), (85, 'itself'), (85, 'his'), (85, 'her'), (85, 'their'), (85, 'our'), (85, 'my'), (85, 'your'), (85, 'the'),
(86, 'it'), (86, 'its'), (86, 'himself'), (86, 'herself'), (86, 'themselves'), (86, 'ourselves'), (86, 'myself'), (86, 'yourself'), (86, 'his'), (86, 'her'),
(87, 'him'), (87, 'her'), (87, 'them'), (87, 'us'), (87, 'me'), (87, 'you'), (87, 'its'), (87, 'itself'), (87, 'his'), (87, 'hers'),
(88, 'He'), (88, 'She'), (88, 'They'), (88, 'We'), (88, 'You'), (88, 'Its'), (88, 'Itself'), (88, 'Them'), (88, 'His'), (88, 'Her');

-- =============================================================================
-- WORD 12: for
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (12, 'for', 'لأجل', 'preposition', 'Used to indicate the person or thing that something is intended for.', 'يستخدم للإشارة إلى الشخص أو الشيء الذي خصص له شيء ما.', 'لأجل', '["لـ", "بسبب", "لمدة"]', '{"base": "for"}', '/fɔːr/', 'for.mp3', '{"synonyms": ["because of"], "antonyms": [], "word_family": []}', 'Can indicate purpose, destination, or duration.', 'Beginner', 12);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(12, 'This gift is {for} you.', 'هذه الهدية لك.', 'for', 'Social', 'Easy', 1, 1),
(12, 'I have lived here {for} two years.', 'لقد عشت هنا لمدة عامين.', 'for', 'Time', 'Easy', 0, 2),
(12, 'What is this tool {for}?', 'فيما تستخدم هذه الأداة؟', 'for', 'Tools', 'Easy', 0, 3),
(12, 'He is waiting {for} the bus.', 'إنه ينتظر الحافلة.', 'for', 'Travel', 'Easy', 0, 4),
(12, 'Thank you {for} your help.', 'شكراً لك على مساعدتك.', 'for', 'Social', 'Easy', 0, 5),
(12, 'We are leaving {for} Paris tomorrow.', 'نحن مغادرون إلى باريس غداً.', 'for', 'Travel', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(12, 'translation_match', 'easy', 'for', 'en', 'لأجل', 'base', NULL, NULL, NULL, '"for" is a preposition often meaning "لأجل" or "لمدة".'),
(12, 'reverse_translation', 'easy', 'لأجل', 'ar', 'for', 'base', NULL, NULL, NULL, 'The Arabic "لأجل" translates to "for" in English.'),
(12, 'sentence_completion', 'easy', 'I bought this ___ you.', 'en', 'for', 'base', 'I bought this ___ you.', 'I bought this for you.', 3, 'Use "for" to indicate the recipient.'),
(12, 'sentence_completion', 'easy', 'Wait ___ me!', 'en', 'for', 'base', 'Wait ___ me!', 'Wait for me!', 1, 'The verb "wait" is followed by "for".'),
(12, 'sentence_completion', 'easy', 'She slept ___ eight hours.', 'en', 'for', 'base', 'She slept ___ eight hours.', 'She slept for eight hours.', 2, 'Use "for" to indicate duration of time.'),
(12, 'sentence_completion', 'easy', 'Is there a cure ___ this?', 'en', 'for', 'base', 'Is there a cure ___ this?', 'Is there a cure for this.', 4, 'Use "for" to indicate purpose or target.'),
(12, 'sentence_completion', 'easy', 'He works ___ a big company.', 'en', 'for', 'base', 'He works ___ a big company.', 'He works for a big company.', 2, 'Use "for" to indicate an employer.'),
(12, 'sentence_completion', 'easy', 'Exercise is good ___ health.', 'en', 'for', 'base', 'Exercise is good ___ health.', 'Exercise is good for health.', 3, 'Use "for" to indicate benefit.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(89, 'من'), (89, 'إلى'), (89, 'في'), (89, 'على'), (89, 'مع'), (89, 'عن'), (89, 'بـ'), (89, 'و'), (89, 'أو'), (89, 'لكن'),
(90, 'from'), (90, 'to'), (90, 'in'), (90, 'on'), (90, 'with'), (90, 'about'), (90, 'by'), (90, 'and'), (90, 'but'), (90, 'at'),
(91, 'from'), (91, 'to'), (91, 'in'), (91, 'on'), (91, 'with'), (91, 'about'), (91, 'by'), (91, 'at'), (91, 'of'), (91, 'since'),
(92, 'from'), (92, 'to'), (92, 'in'), (92, 'on'), (92, 'with'), (92, 'about'), (92, 'by'), (92, 'at'), (92, 'of'), (92, 'since'),
(93, 'from'), (93, 'to'), (93, 'in'), (93, 'on'), (93, 'with'), (93, 'about'), (93, 'by'), (93, 'at'), (93, 'of'), (93, 'since'),
(94, 'from'), (94, 'to'), (94, 'in'), (94, 'on'), (94, 'with'), (94, 'about'), (94, 'by'), (94, 'at'), (94, 'of'), (94, 'since'),
(95, 'from'), (95, 'to'), (95, 'in'), (95, 'on'), (95, 'with'), (95, 'about'), (95, 'by'), (95, 'at'), (95, 'of'), (95, 'since'),
(96, 'from'), (96, 'to'), (96, 'in'), (96, 'on'), (96, 'with'), (96, 'about'), (96, 'by'), (96, 'at'), (96, 'of'), (96, 'since');

-- =============================================================================
-- WORD 13: not
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (13, 'not', 'ليس / لا', 'adverb', 'Used with an auxiliary verb or "be" to form the negative.', 'يستخدم مع فعل مساعد أو فعل الكينونة لتكوين النفي.', 'ليس / لا', '["ما", "لن", "لم"]', '{"base": "not", "contraction": "n''t"}', '/nɒt/', 'not.mp3', '{"synonyms": ["never"], "antonyms": [], "word_family": []}', 'Usually placed after the first auxiliary verb.', 'Beginner', 13);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(13, 'I am {not} hungry.', 'أنا لست جائعاً.', 'not', 'Needs', 'Easy', 1, 1),
(13, 'Do {not} open the door.', 'لا تفتح الباب.', 'not', 'Instruction', 'Easy', 0, 2),
(13, 'She is {not} here.', 'هي ليست هنا.', 'not', 'Location', 'Easy', 0, 3),
(13, 'It is {not} raining.', 'إنها لا تمطر.', 'not', 'Weather', 'Easy', 0, 4),
(13, 'They do {not} like fish.', 'هم لا يحبون السمك.', 'not', 'Preferences', 'Easy', 0, 5),
(13, 'He can {not} swim.', 'هو لا يستطيع السباحة.', 'not', 'Ability', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(13, 'translation_match', 'easy', 'not', 'en', 'ليس / لا', 'base', NULL, NULL, NULL, '"not" is the primary word used for negation.'),
(13, 'reverse_translation', 'easy', 'ليس / لا', 'ar', 'not', 'base', NULL, NULL, NULL, 'The Arabic negation "ليس" or "لا" translates to "not".'),
(13, 'sentence_completion', 'easy', 'I am ___ a doctor.', 'en', 'not', 'base', 'I am ___ a doctor.', 'I am not a doctor.', 2, 'Use "not" after "am" to negate the sentence.'),
(13, 'sentence_completion', 'easy', 'Do ___ run in the hall.', 'en', 'not', 'base', 'Do ___ run in the hall.', 'Do not run in the hall.', 1, 'Use "not" with "do" for negative commands.'),
(13, 'sentence_completion', 'easy', 'He does ___ have a car.', 'en', 'not', 'base', 'He does ___ have a car.', 'He does not have a car.', 2, 'Use "not" after "does" for third-person negation.'),
(13, 'sentence_completion', 'easy', 'That is ___ my bag.', 'en', 'not', 'base', 'That is ___ my bag.', 'That is not my bag.', 2, 'Use "not" after "is" to negate possession.'),
(13, 'sentence_completion', 'easy', 'We are ___ ready yet.', 'en', 'not', 'base', 'We are ___ ready yet.', 'We are not ready yet.', 2, 'Use "not" after "are" for plural negation.'),
(13, 'sentence_completion', 'easy', 'It was ___ my fault.', 'en', 'not', 'base', 'It was ___ my fault.', 'It was not my fault.', 2, 'Use "not" after "was" for past negation.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(97, 'نعم'), (97, 'ربما'), (97, 'دائماً'), (97, 'أبداً'), (97, 'جداً'), (97, 'هنا'), (97, 'هناك'), (97, 'الآن'), (97, 'فقط'), (97, 'أيضاً'),
(98, 'yes'), (98, 'maybe'), (98, 'always'), (98, 'never'), (98, 'very'), (98, 'here'), (98, 'there'), (98, 'now'), (98, 'only'), (98, 'also'),
(99, 'no'), (99, 'never'), (99, 'always'), (99, 'very'), (99, 'here'), (99, 'there'), (99, 'now'), (99, 'only'), (99, 'also'), (99, 'but'),
(100, 'no'), (100, 'never'), (100, 'always'), (100, 'very'), (100, 'here'), (100, 'there'), (100, 'now'), (100, 'only'), (100, 'also'), (100, 'but'),
(101, 'no'), (101, 'never'), (101, 'always'), (101, 'very'), (101, 'here'), (101, 'there'), (101, 'now'), (101, 'only'), (101, 'also'), (101, 'but'),
(102, 'no'), (102, 'never'), (102, 'always'), (102, 'very'), (102, 'here'), (102, 'there'), (102, 'now'), (102, 'only'), (102, 'also'), (102, 'but'),
(103, 'no'), (103, 'never'), (103, 'always'), (103, 'very'), (103, 'here'), (103, 'there'), (103, 'now'), (103, 'only'), (103, 'also'), (103, 'but'),
(104, 'no'), (104, 'never'), (104, 'always'), (104, 'very'), (104, 'here'), (104, 'there'), (104, 'now'), (104, 'only'), (104, 'also'), (104, 'but');

-- =============================================================================
-- WORD 14: on
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (14, 'on', 'على', 'preposition', 'Physically in contact with and supported by a surface.', 'ملامس جسدياً لسطح ما ومدعوم به.', 'على', '["فوق", "في (للأيام)"]', '{"base": "on"}', '/ɒn/', 'on.mp3', '{"synonyms": ["upon", "atop"], "antonyms": ["off", "under"], "word_family": []}', 'Used for surfaces, days of the week, and electronic devices.', 'Beginner', 14);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(14, 'The book is {on} the table.', 'الكتاب على الطاولة.', 'on', 'Home', 'Easy', 1, 1),
(14, 'I will see you {on} Monday.', 'سأراك يوم الاثنين.', 'on', 'Time', 'Easy', 0, 2),
(14, 'Turn {on} the light.', 'أشعل الضوء.', 'on', 'Instruction', 'Easy', 0, 3),
(14, 'He is {on} the phone.', 'إنه يتحدث في الهاتف.', 'on', 'Communication', 'Easy', 0, 4),
(14, 'The picture is {on} the wall.', 'الصورة على الحائط.', 'on', 'Home', 'Easy', 0, 5),
(14, 'We are {on} the bus.', 'نحن في الحافلة.', 'on', 'Travel', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(14, 'translation_match', 'easy', 'on', 'en', 'على', 'base', NULL, NULL, NULL, '"on" is the primary preposition for surfaces.'),
(14, 'reverse_translation', 'easy', 'على', 'ar', 'on', 'base', NULL, NULL, NULL, 'The Arabic "على" translates to "on" in English.'),
(14, 'sentence_completion', 'easy', 'Put the cup ___ the desk.', 'en', 'on', 'base', 'Put the cup ___ the desk.', 'Put the cup on the desk.', 3, 'Use "on" for objects on a surface.'),
(14, 'sentence_completion', 'easy', 'My birthday is ___ Friday.', 'en', 'on', 'base', 'My birthday is ___ Friday.', 'My birthday is on Friday.', 3, 'Use "on" before days of the week.'),
(14, 'sentence_completion', 'easy', 'The cat is sitting ___ the floor.', 'en', 'on', 'base', 'The cat is sitting ___ the floor.', 'The cat is sitting on the floor.', 4, 'Use "on" for the floor.'),
(14, 'sentence_completion', 'easy', 'Is the TV ___?', 'en', 'on', 'base', 'Is the TV ___?', 'Is the TV on?', 3, 'Use "on" to indicate a device is working.'),
(14, 'sentence_completion', 'easy', 'He lives ___ Main Street.', 'en', 'on', 'base', 'He lives ___ Main Street.', 'He lives on Main Street.', 2, 'Use "on" for street names in many contexts.'),
(14, 'sentence_completion', 'easy', 'There is a fly ___ the ceiling.', 'en', 'on', 'base', 'There is a fly ___ the ceiling.', 'There is a fly on the ceiling.', 4, 'Use "on" for contact with a surface, even overhead.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(105, 'في'), (105, 'من'), (105, 'إلى'), (105, 'عن'), (105, 'مع'), (105, 'بـ'), (105, 'لـ'), (105, 'تحت'), (105, 'فوق'), (105, 'بين'),
(106, 'in'), (106, 'at'), (106, 'to'), (106, 'from'), (106, 'by'), (106, 'with'), (106, 'under'), (106, 'of'), (106, 'for'), (106, 'about'),
(107, 'in'), (107, 'at'), (107, 'to'), (107, 'from'), (107, 'by'), (107, 'with'), (107, 'under'), (107, 'of'), (107, 'for'), (107, 'about'),
(108, 'in'), (108, 'at'), (108, 'to'), (108, 'from'), (108, 'by'), (108, 'with'), (108, 'under'), (108, 'of'), (108, 'for'), (108, 'about'),
(109, 'in'), (109, 'at'), (109, 'to'), (109, 'from'), (109, 'by'), (109, 'with'), (109, 'under'), (109, 'of'), (109, 'for'), (109, 'about'),
(110, 'in'), (110, 'at'), (110, 'to'), (110, 'from'), (110, 'by'), (110, 'with'), (110, 'under'), (110, 'of'), (110, 'for'), (110, 'about'),
(111, 'in'), (111, 'at'), (111, 'to'), (111, 'from'), (111, 'by'), (111, 'with'), (111, 'under'), (111, 'of'), (111, 'for'), (111, 'about'),
(112, 'in'), (112, 'at'), (112, 'to'), (112, 'from'), (112, 'by'), (112, 'with'), (112, 'under'), (112, 'of'), (112, 'for'), (112, 'about');

-- =============================================================================
-- WORD 15: with
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (15, 'with', 'مع', 'preposition', 'Accompanied by another person or thing.', 'برفقة شخص أو شيء آخر.', 'مع', '["بواسطة", "بـ"]', '{"base": "with"}', '/wɪð/', 'with.mp3', '{"synonyms": ["alongside"], "antonyms": ["without"], "word_family": []}', 'Used to indicate accompaniment, instrument, or manner.', 'Beginner', 15);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(15, 'I am {with} my friend.', 'أنا مع صديقي.', 'with', 'Social', 'Easy', 1, 1),
(15, 'Coffee {with} milk, please.', 'قهوة مع حليب، من فضلك.', 'with', 'Food', 'Easy', 0, 2),
(15, 'He writes {with} a pen.', 'يكتب بقلم.', 'with', 'Tools', 'Easy', 0, 3),
(15, 'Come {with} me.', 'تعال معي.', 'with', 'Social', 'Easy', 0, 4),
(15, 'A girl {with} blue eyes.', 'فتاة ذات عيون زرقاء.', 'with', 'Description', 'Easy', 0, 5),
(15, 'Handle {with} care.', 'تعامل بعناية.', 'with', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(15, 'translation_match', 'easy', 'with', 'en', 'مع', 'base', NULL, NULL, NULL, '"with" is the primary preposition for accompaniment.'),
(15, 'reverse_translation', 'easy', 'مع', 'ar', 'with', 'base', NULL, NULL, NULL, 'The Arabic "مع" translates to "with" in English.'),
(15, 'sentence_completion', 'easy', 'I live ___ my parents.', 'en', 'with', 'base', 'I live ___ my parents.', 'I live with my parents.', 2, 'Use "with" to show accompaniment.'),
(15, 'sentence_completion', 'easy', 'Cut the bread ___ a knife.', 'en', 'with', 'base', 'Cut the bread ___ a knife.', 'Cut the bread with a knife.', 3, 'Use "with" to indicate the tool used.'),
(15, 'sentence_completion', 'easy', 'Are you ___ us?', 'en', 'with', 'base', 'Are you ___ us?', 'Are you with us?', 2, 'Use "with" to ask about agreement or presence.'),
(15, 'sentence_completion', 'easy', 'He is angry ___ me.', 'en', 'with', 'base', 'He is angry ___ me.', 'He is angry with me.', 3, 'Use "with" after certain adjectives like "angry".'),
(15, 'sentence_completion', 'easy', 'Tea ___ sugar.', 'en', 'with', 'base', 'Tea ___ sugar.', 'Tea with sugar.', 1, 'Use "with" for ingredients or additions.'),
(15, 'sentence_completion', 'easy', 'Walk ___ me.', 'en', 'with', 'base', 'Walk ___ me.', 'Walk with me.', 1, 'Use "with" for walking together.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(113, 'من'), (113, 'إلى'), (113, 'في'), (113, 'على'), (113, 'عن'), (113, 'بـ'), (113, 'لـ'), (113, 'بدون'), (113, 'تحت'), (113, 'فوق'),
(114, 'without'), (114, 'from'), (114, 'to'), (114, 'in'), (114, 'on'), (114, 'at'), (114, 'by'), (114, 'for'), (114, 'about'), (114, 'of'),
(115, 'without'), (115, 'from'), (115, 'to'), (115, 'in'), (115, 'on'), (115, 'at'), (115, 'by'), (115, 'for'), (115, 'about'), (115, 'of'),
(116, 'without'), (116, 'from'), (116, 'to'), (116, 'in'), (116, 'on'), (116, 'at'), (116, 'by'), (116, 'for'), (116, 'about'), (116, 'of'),
(117, 'without'), (117, 'from'), (117, 'to'), (117, 'in'), (117, 'on'), (117, 'at'), (117, 'by'), (117, 'for'), (117, 'about'), (117, 'of'),
(118, 'without'), (118, 'from'), (118, 'to'), (118, 'in'), (118, 'on'), (118, 'at'), (118, 'by'), (118, 'for'), (118, 'about'), (118, 'of'),
(119, 'without'), (119, 'from'), (119, 'to'), (119, 'in'), (119, 'on'), (119, 'at'), (119, 'by'), (119, 'for'), (119, 'about'), (119, 'of'),
(120, 'without'), (120, 'from'), (120, 'to'), (120, 'in'), (120, 'on'), (120, 'at'), (120, 'by'), (120, 'for'), (120, 'about'), (120, 'of');

-- =============================================================================
-- WORD 16: he
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (16, 'he', 'هو', 'pronoun', 'Used to refer to a man, boy, or male animal previously mentioned.', 'يستخدم للإشارة إلى رجل أو ولد أو حيوان ذكر ذكر سابقاً.', 'هو', '[]', '{"subject": "he", "object": "him", "possessive": "his", "possessive_pronoun": "his", "reflexive": "himself"}', '/hiː/', 'he.mp3', '{"synonyms": [], "antonyms": ["she"], "word_family": []}', 'The third-person singular masculine subject pronoun.', 'Beginner', 16);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(16, '{He} is my brother.', 'هو أخي.', 'he', 'Family', 'Easy', 1, 1),
(16, 'I saw {him} at the park.', 'رأيته في الحديقة.', 'him', 'Social', 'Easy', 0, 2),
(16, 'This is {his} car.', 'هذه سيارته.', 'his', 'Possession', 'Easy', 0, 3),
(16, 'The book is {his}.', 'الكتاب له.', 'his', 'Possession', 'Easy', 0, 4),
(16, 'He fixed the bike {himself}.', 'أصلح الدراجة بنفسه.', 'himself', 'Action', 'Easy', 0, 5),
(16, '{He} likes to play football.', 'هو يحب لعب كرة القدم.', 'he', 'Hobbies', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(16, 'translation_match', 'easy', 'he', 'en', 'هو', 'subject', NULL, NULL, NULL, '"he" is the masculine subject pronoun.'),
(16, 'reverse_translation', 'easy', 'هو', 'ar', 'he', 'subject', NULL, NULL, NULL, 'The Arabic "هو" translates to "he" in English.'),
(16, 'sentence_completion', 'easy', '___ is a doctor.', 'en', 'He', 'subject', '___ is a doctor.', 'He is a doctor.', 0, 'Use "He" as the subject for a male person.'),
(16, 'sentence_completion', 'easy', 'Give the book to ___.', 'en', 'him', 'object', 'Give the book to ___.', 'Give the book to him.', 4, 'Use "him" as the object pronoun.'),
(16, 'sentence_completion', 'easy', '___ father is a teacher.', 'en', 'His', 'possessive', '___ father is a teacher.', 'His father is a teacher.', 0, 'Use "His" to show possession for a male.'),
(16, 'sentence_completion', 'easy', 'He lives by ___.', 'en', 'himself', 'reflexive', 'He lives by ___.', 'He lives by himself.', 3, 'Use "himself" to mean alone or without help.'),
(16, 'sentence_completion', 'easy', 'Is that bag ___?', 'en', 'his', 'possessive_pronoun', 'Is that bag ___?', 'Is that bag his?', 3, 'Use "his" as a possessive pronoun at the end of a sentence.'),
(16, 'sentence_completion', 'easy', '___ is very tall.', 'en', 'He', 'subject', '___ is very tall.', 'He is very tall.', 0, 'Use "He" as the subject pronoun.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(121, 'هي'), (121, 'أنا'), (121, 'نحن'), (121, 'هم'), (121, 'أنت'), (121, 'هذا'), (121, 'ذلك'), (121, 'من'), (121, 'إلى'), (121, 'في'),
(122, 'she'), (122, 'I'), (122, 'we'), (122, 'they'), (122, 'you'), (122, 'it'), (122, 'him'), (122, 'his'), (122, 'her'), (122, 'them'),
(123, 'She'), (123, 'I'), (123, 'We'), (123, 'They'), (123, 'You'), (123, 'It'), (123, 'Him'), (123, 'His'), (123, 'Her'), (123, 'Them'),
(124, 'he'), (124, 'his'), (124, 'himself'), (124, 'she'), (124, 'her'), (124, 'it'), (124, 'me'), (124, 'us'), (124, 'them'), (124, 'you'),
(125, 'He'), (125, 'Him'), (125, 'Himself'), (125, 'She'), (125, 'Her'), (125, 'It'), (125, 'My'), (125, 'Our'), (125, 'Their'), (125, 'Your'),
(126, 'he'), (126, 'him'), (126, 'his'), (126, 'she'), (126, 'her'), (126, 'herself'), (126, 'myself'), (126, 'yourself'), (126, 'itself'), (126, 'themselves'),
(127, 'he'), (127, 'him'), (127, 'himself'), (127, 'she'), (127, 'her'), (127, 'hers'), (127, 'mine'), (127, 'ours'), (127, 'theirs'), (127, 'yours'),
(128, 'She'), (128, 'I'), (128, 'We'), (128, 'They'), (128, 'You'), (128, 'It'), (128, 'Him'), (128, 'His'), (128, 'Her'), (128, 'Them');

-- =============================================================================
-- WORD 17: as
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (17, 'as', 'كـ / كما', 'conjunction', 'Used to indicate that something happens during the time when something else is taking place.', 'يستخدم للإشارة إلى أن شيئاً ما يحدث في الوقت الذي يحدث فيه شيء آخر.', 'كـ / كما', '["بينما", "بما أن", "مثل"]', '{"base": "as"}', '/æz/', 'as.mp3', '{"synonyms": ["while", "because", "like"], "antonyms": [], "word_family": []}', 'Can be used for comparison, time, or role.', 'Beginner', 17);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(17, 'He works {as} a teacher.', 'هو يعمل كمعلم.', 'as', 'Jobs', 'Easy', 1, 1),
(17, 'She is {as} tall {as} her mother.', 'هي طويلة مثل والدتها.', 'as', 'Comparison', 'Easy', 0, 2),
(17, 'Do {as} I say.', 'افعل كما أقول.', 'as', 'Instruction', 'Easy', 0, 3),
(17, '{As} it was raining, we stayed home.', 'بما أنها كانت تمطر، بقينا في المنزل.', 'as', 'Reason', 'Easy', 0, 4),
(17, 'I saw him {as} I was leaving.', 'رأيته بينما كنت أغادر.', 'as', 'Time', 'Easy', 0, 5),
(17, 'It is not {as} easy {as} it looks.', 'الأمر ليس سهلاً كما يبدو.', 'as', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(17, 'translation_match', 'easy', 'as', 'en', 'كـ / كما', 'base', NULL, NULL, NULL, '"as" is used to describe roles or comparisons.'),
(17, 'reverse_translation', 'easy', 'كـ / كما', 'ar', 'as', 'base', NULL, NULL, NULL, 'The Arabic "كـ" or "كما" often translates to "as".'),
(17, 'sentence_completion', 'easy', 'She works ___ a nurse.', 'en', 'as', 'base', 'She works ___ a nurse.', 'She works as a nurse.', 2, 'Use "as" to indicate a job or role.'),
(17, 'sentence_completion', 'easy', 'He is as strong ___ an ox.', 'en', 'as', 'base', 'He is as strong ___ an ox.', 'He is as strong as an ox.', 4, 'Use "as...as" for comparisons.'),
(17, 'sentence_completion', 'easy', '___ I mentioned before, it is free.', 'en', 'As', 'base', '___ I mentioned before, it is free.', 'As I mentioned before, it is free.', 0, 'Use "As" to refer back to a previous statement.'),
(17, 'sentence_completion', 'easy', 'I arrived just ___ he left.', 'en', 'as', 'base', 'I arrived just ___ he left.', 'I arrived just as he left.', 3, 'Use "as" to indicate simultaneous actions.'),
(17, 'sentence_completion', 'easy', '___ you know, today is a holiday.', 'en', 'As', 'base', '___ you know, today is a holiday.', 'As you know, today is a holiday.', 0, 'Use "As" to introduce a known fact.'),
(17, 'sentence_completion', 'easy', 'It is not so big ___ that one.', 'en', 'as', 'base', 'It is not so big ___ that one.', 'It is not so big as that one.', 4, 'Use "as" in negative comparisons.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(129, 'من'), (129, 'إلى'), (129, 'في'), (129, 'على'), (129, 'مع'), (129, 'عن'), (129, 'بـ'), (129, 'و'), (129, 'أو'), (129, 'لكن'),
(130, 'than'), (130, 'like'), (130, 'so'), (130, 'but'), (130, 'for'), (130, 'from'), (130, 'with'), (130, 'at'), (130, 'by'), (130, 'of'),
(131, 'like'), (131, 'than'), (131, 'so'), (131, 'but'), (131, 'for'), (131, 'from'), (131, 'with'), (131, 'at'), (131, 'by'), (131, 'of'),
(132, 'than'), (132, 'like'), (132, 'so'), (132, 'but'), (132, 'for'), (132, 'from'), (132, 'with'), (132, 'at'), (132, 'by'), (132, 'of'),
(133, 'Than'), (133, 'Like'), (133, 'So'), (133, 'But'), (133, 'For'), (133, 'From'), (133, 'With'), (133, 'At'), (133, 'By'), (133, 'Of'),
(134, 'than'), (134, 'like'), (134, 'so'), (134, 'but'), (134, 'for'), (134, 'from'), (134, 'with'), (134, 'at'), (134, 'by'), (134, 'of'),
(135, 'Than'), (135, 'Like'), (135, 'So'), (135, 'But'), (135, 'For'), (135, 'From'), (135, 'With'), (135, 'At'), (135, 'By'), (135, 'Of'),
(136, 'than'), (136, 'like'), (136, 'so'), (136, 'but'), (136, 'for'), (136, 'from'), (136, 'with'), (136, 'at'), (136, 'by'), (136, 'of');

-- =============================================================================
-- WORD 18: you
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (18, 'you', 'أنت', 'pronoun', 'Used to refer to the person or people that the speaker is addressing.', 'يستخدم للإشارة إلى الشخص أو الأشخاص الذين يخاطبهم المتحدث.', 'أنت', '["أنتم", "أنتِ", "أنتما", "أنتن"]', '{"subject": "you", "object": "you", "possessive": "your", "possessive_pronoun": "yours", "reflexive": "yourself", "reflexive_plural": "yourselves"}', '/juː/', 'you.mp3', '{"synonyms": [], "antonyms": [], "word_family": []}', 'Used for both singular and plural second person.', 'Beginner', 18);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(18, '{You} are very kind.', 'أنت طيب جداً.', 'you', 'Social', 'Easy', 1, 1),
(18, 'I will call {you} later.', 'سأتصل بك لاحقاً.', 'you', 'Communication', 'Easy', 0, 2),
(18, 'Is this {your} pen?', 'هل هذا قلمك؟', 'your', 'Possession', 'Easy', 0, 3),
(18, 'This seat is {yours}.', 'هذا المقعد لك.', 'yours', 'Possession', 'Easy', 0, 4),
(18, 'Please do it {yourself}.', 'من فضلك افعل ذلك بنفسك.', 'yourself', 'Instruction', 'Easy', 0, 5),
(18, 'I love {you}.', 'أنا أحبك.', 'you', 'Emotion', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(18, 'translation_match', 'easy', 'you', 'en', 'أنت', 'subject', NULL, NULL, NULL, '"you" is the second-person pronoun.'),
(18, 'reverse_translation', 'easy', 'أنت', 'ar', 'you', 'subject', NULL, NULL, NULL, 'The Arabic "أنت" translates to "you" in English.'),
(18, 'sentence_completion', 'easy', '___ look happy today.', 'en', 'You', 'subject', '___ look happy today.', 'You look happy today.', 0, 'Use "You" as the subject pronoun.'),
(18, 'sentence_completion', 'easy', 'I can help ___ with that.', 'en', 'you', 'object', 'I can help ___ with that.', 'I can help you with that.', 3, 'Use "you" as the object pronoun.'),
(18, 'sentence_completion', 'easy', 'What is ___ name?', 'en', 'your', 'possessive', 'What is ___ name?', 'What is your name?', 2, 'Use "your" to show possession.'),
(18, 'sentence_completion', 'easy', 'The choice is ___.', 'en', 'yours', 'possessive_pronoun', 'The choice is ___.', 'The choice is yours.', 3, 'Use "yours" as a possessive pronoun at the end of a sentence.'),
(18, 'sentence_completion', 'easy', 'Take care of ___.', 'en', 'yourself', 'reflexive', 'Take care of ___.', 'Take care of yourself.', 3, 'Use "yourself" as the reflexive pronoun for singular "you".'),
(18, 'sentence_completion', 'easy', '___ are all welcome.', 'en', 'You', 'subject', '___ are all welcome.', 'You are all welcome.', 0, 'Use "You" for plural address as well.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(137, 'أنا'), (137, 'هو'), (137, 'هي'), (137, 'نحن'), (137, 'هم'), (137, 'هذا'), (137, 'ذلك'), (137, 'من'), (137, 'إلى'), (137, 'في'),
(138, 'I'), (138, 'he'), (138, 'she'), (138, 'we'), (138, 'they'), (138, 'it'), (138, 'me'), (138, 'him'), (138, 'her'), (138, 'them'),
(139, 'I'), (139, 'He'), (139, 'She'), (139, 'We'), (139, 'They'), (139, 'It'), (139, 'Me'), (139, 'Him'), (139, 'Her'), (139, 'Them'),
(140, 'I'), (140, 'me'), (140, 'my'), (140, 'mine'), (140, 'he'), (140, 'him'), (140, 'his'), (140, 'she'), (140, 'her'), (140, 'them'),
(141, 'you'), (141, 'yours'), (141, 'yourself'), (141, 'I'), (141, 'my'), (141, 'me'), (141, 'he'), (141, 'his'), (141, 'she'), (141, 'her'),
(142, 'you'), (142, 'your'), (142, 'yourself'), (142, 'I'), (142, 'mine'), (142, 'me'), (142, 'he'), (142, 'his'), (142, 'she'), (142, 'her'),
(143, 'you'), (143, 'your'), (143, 'yours'), (143, 'I'), (143, 'myself'), (143, 'me'), (143, 'himself'), (143, 'herself'), (143, 'themselves'), (143, 'ourselves'),
(144, 'I'), (144, 'He'), (144, 'She'), (144, 'We'), (144, 'They'), (144, 'It'), (144, 'Me'), (144, 'Him'), (144, 'Her'), (144, 'Them');

-- =============================================================================
-- WORD 19: do
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (19, 'do', 'يفعل', 'verb', 'To perform an action, activity, or task.', 'للقيام بعمل أو نشاط أو مهمة.', 'يفعل', '["يقوم بـ", "يؤدي"]', '{"base": "do", "thirdPerson": "does", "past": "did", "participle": "done", "gerund": "doing"}', '/duː/', 'do.mp3', '{"synonyms": ["perform", "act"], "antonyms": ["undo"], "word_family": ["deed", "doer"]}', 'Used as both a main verb and an auxiliary verb for questions and negatives.', 'Beginner', 19);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(19, 'I {do} my homework every day.', 'أنا أفعل واجبي كل يوم.', 'do', 'Education', 'Easy', 1, 1),
(19, 'She {does} yoga in the morning.', 'هي تمارس اليوغا في الصباح.', 'does', 'Health', 'Easy', 0, 2),
(19, 'He {did} a great job.', 'لقد قام بعمل رائع.', 'did', 'Work', 'Easy', 0, 3),
(19, 'What are you {doing}?', 'ماذا تفعل؟', 'doing', 'General', 'Easy', 0, 4),
(19, 'The work is finally {done}.', 'العمل انتهى أخيراً.', 'done', 'Work', 'Easy', 0, 5),
(19, '{Do} you like coffee?', 'هل تحب القهوة؟', 'do', 'Preferences', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(19, 'translation_match', 'easy', 'do', 'en', 'يفعل', 'base', NULL, NULL, NULL, '"do" is the base form of the verb to perform an action.'),
(19, 'reverse_translation', 'easy', 'يفعل', 'ar', 'do', 'base', NULL, NULL, NULL, 'The Arabic "يفعل" translates to "do" in English.'),
(19, 'sentence_completion', 'easy', 'I ___ my best.', 'en', 'do', 'base', 'I ___ my best.', 'I do my best.', 1, 'Use "do" with the pronoun "I".'),
(19, 'sentence_completion', 'easy', 'He ___ his laundry on Sundays.', 'en', 'does', 'thirdPerson', 'He ___ his laundry on Sundays.', 'He does his laundry on Sundays.', 1, 'Use "does" for third-person singular present.'),
(19, 'sentence_completion', 'easy', 'We ___ our chores yesterday.', 'en', 'did', 'past', 'We ___ our chores yesterday.', 'We did our chores yesterday.', 1, 'Use "did" for the past tense.'),
(19, 'sentence_completion', 'easy', 'What have you ___ today?', 'en', 'done', 'participle', 'What have you ___ today?', 'What have you done today?', 3, 'Use "done" as the past participle after "have".'),
(19, 'sentence_completion', 'easy', 'She is ___ her hair.', 'en', 'doing', 'gerund', 'She is ___ her hair.', 'She is doing her hair.', 2, 'Use "doing" for continuous actions.'),
(19, 'sentence_completion', 'easy', '___ you want some tea?', 'en', 'Do', 'base', '___ you want some tea?', 'Do you want some tea?', 0, 'Use "Do" to start a question in the present tense.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(145, 'يذهب'), (145, 'يأكل'), (145, 'يرى'), (145, 'يملك'), (145, 'يكون'), (145, 'يقول'), (145, 'يأخذ'), (145, 'يعطي'), (145, 'يأتي'), (145, 'يصنع'),
(146, 'go'), (146, 'eat'), (146, 'see'), (146, 'have'), (146, 'be'), (146, 'say'), (146, 'take'), (146, 'give'), (146, 'come'), (146, 'make'),
(147, 'does'), (147, 'did'), (147, 'done'), (147, 'doing'), (147, 'make'), (147, 'makes'), (147, 'made'), (147, 'making'), (147, 'go'), (147, 'goes'),
(148, 'do'), (148, 'did'), (148, 'done'), (148, 'doing'), (148, 'make'), (148, 'makes'), (148, 'made'), (148, 'making'), (148, 'go'), (148, 'goes'),
(149, 'do'), (149, 'does'), (149, 'done'), (149, 'doing'), (149, 'make'), (149, 'makes'), (149, 'made'), (149, 'making'), (149, 'go'), (149, 'goes'),
(150, 'do'), (150, 'does'), (150, 'did'), (150, 'doing'), (150, 'make'), (150, 'makes'), (150, 'made'), (150, 'making'), (150, 'go'), (150, 'goes'),
(151, 'do'), (151, 'does'), (151, 'did'), (151, 'done'), (151, 'make'), (151, 'makes'), (151, 'made'), (151, 'making'), (151, 'go'), (151, 'goes'),
(152, 'Does'), (152, 'Did'), (152, 'Done'), (152, 'Doing'), (152, 'Make'), (152, 'Makes'), (152, 'Made'), (152, 'Making'), (152, 'Go'), (152, 'Is');

-- =============================================================================
-- WORD 20: get
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (20, 'get', 'يحصل على', 'verb', 'To receive, obtain, or reach a state.', 'أن يتلقى، يحصل على، أو يصل إلى حالة معينة.', 'يحصل على', '["ينال", "يصل", "يصبح"]', '{"base": "get", "thirdPerson": "gets", "past": "got", "participle": "gotten", "gerund": "getting"}', '/ɡɛt/', 'get.mp3', '{"synonyms": ["obtain", "receive", "become"], "antonyms": ["give", "lose"], "word_family": ["getter"]}', 'A very versatile verb used in many phrasal verbs.', 'Beginner', 20);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(20, 'I need to {get} some water.', 'أحتاج للحصول على بعض الماء.', 'get', 'Needs', 'Easy', 1, 1),
(20, 'She {gets} a lot of emails.', 'هي تتلقى الكثير من رسائل البريد الإلكتروني.', 'gets', 'Work', 'Easy', 0, 2),
(20, 'He {got} a new car last week.', 'حصل على سيارة جديدة الأسبوع الماضي.', 'got', 'Possession', 'Easy', 0, 3),
(20, 'It is {getting} dark outside.', 'بدأ الجو يظلم في الخارج.', 'getting', 'Weather', 'Easy', 0, 4),
(20, 'They have {gotten} much better.', 'لقد أصبحوا أفضل بكثير.', 'gotten', 'Improvement', 'Easy', 0, 5),
(20, 'Can you {get} me the book?', 'هل يمكنك إحضار الكتاب لي؟', 'get', 'Request', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(20, 'translation_match', 'easy', 'get', 'en', 'يحصل على', 'base', NULL, NULL, NULL, '"get" commonly means to obtain or receive.'),
(20, 'reverse_translation', 'easy', 'يحصل على', 'ar', 'get', 'base', NULL, NULL, NULL, 'The Arabic "يحصل على" translates to "get".'),
(20, 'sentence_completion', 'easy', 'I usually ___ up at 7 AM.', 'en', 'get', 'base', 'I usually ___ up at 7 AM.', 'I usually get up at 7 AM.', 2, 'Use the base form for habitual actions.'),
(20, 'sentence_completion', 'easy', 'She ___ a promotion.', 'en', 'gets', 'thirdPerson', 'She ___ a promotion.', 'She gets a promotion.', 1, 'Use "gets" for third-person singular present.'),
(20, 'sentence_completion', 'easy', 'We ___ lost in the city.', 'en', 'got', 'past', 'We ___ lost in the city.', 'We got lost in the city.', 1, 'Use "got" for past tense.'),
(20, 'sentence_completion', 'easy', 'It is ___ cold.', 'en', 'getting', 'gerund', 'It is ___ cold.', 'It is getting cold.', 2, 'Use "getting" for a changing state.'),
(20, 'sentence_completion', 'easy', 'I have ___ a gift for you.', 'en', 'gotten', 'participle', 'I have ___ a gift for you.', 'I have gotten a gift for you.', 2, 'Use "gotten" as the past participle.'),
(20, 'sentence_completion', 'easy', 'Did you ___ my message?', 'en', 'get', 'base', 'Did you ___ my message?', 'Did you get my message?', 2, 'Use base form after "did".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(153, 'يعطي'), (153, 'يذهب'), (153, 'يأكل'), (153, 'ينام'), (153, 'يرى'), (153, 'يفعل'), (153, 'يقول'), (153, 'يأخذ'), (153, 'يضع'), (153, 'يفتح'),
(154, 'give'), (154, 'take'), (154, 'make'), (154, 'do'), (154, 'see'), (154, 'go'), (154, 'come'), (154, 'stay'), (154, 'leave'), (154, 'put'),
(155, 'gets'), (155, 'got'), (155, 'getting'), (155, 'gotten'), (155, 'give'), (155, 'gives'), (155, 'gave'), (155, 'given'), (155, 'giving'), (155, 'go'),
(156, 'get'), (156, 'got'), (156, 'getting'), (156, 'gotten'), (156, 'give'), (156, 'gives'), (156, 'gave'), (156, 'given'), (156, 'giving'), (156, 'go'),
(157, 'get'), (157, 'gets'), (157, 'getting'), (157, 'gotten'), (157, 'give'), (157, 'gives'), (157, 'gave'), (157, 'given'), (157, 'giving'), (157, 'go'),
(158, 'get'), (158, 'gets'), (158, 'got'), (158, 'gotten'), (158, 'give'), (158, 'gives'), (158, 'gave'), (158, 'given'), (158, 'giving'), (158, 'go'),
(159, 'get'), (159, 'gets'), (159, 'got'), (159, 'getting'), (159, 'give'), (159, 'gives'), (159, 'gave'), (159, 'given'), (159, 'giving'), (159, 'go'),
(160, 'gets'), (160, 'got'), (160, 'getting'), (160, 'gotten'), (160, 'give'), (160, 'gives'), (160, 'gave'), (160, 'given'), (160, 'giving'), (160, 'go');

-- =============================================================================
-- WORD 21: say
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (21, 'say', 'يقول', 'verb', 'To utter words so as to convey information, an opinion, or a feeling.', 'نطق الكلمات لنقل معلومات أو رأي أو شعور.', 'يقول', '["يصرح", "يذكر"]', '{"base": "say", "thirdPerson": "says", "past": "said", "participle": "said", "gerund": "saying"}', '/seɪ/', 'say.mp3', '{"synonyms": ["tell", "speak", "utter"], "antonyms": ["be silent"], "word_family": ["saying"]}', 'Used for direct and indirect speech.', 'Beginner', 21);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(21, 'What did you {say}?', 'ماذا قلت؟', 'say', 'Communication', 'Easy', 1, 1),
(21, 'He {says} that he is busy.', 'يقول إنه مشغول.', 'says', 'Communication', 'Easy', 0, 2),
(21, 'She {said} goodbye to everyone.', 'قالت وداعاً للجميع.', 'said', 'Social', 'Easy', 0, 3),
(21, 'I am {saying} the truth.', 'أنا أقول الحقيقة.', 'saying', 'General', 'Easy', 0, 4),
(21, 'It is hard to {say} no.', 'من الصعب قول لا.', 'say', 'Emotion', 'Easy', 0, 5),
(21, 'They {say} it will rain today.', 'يقولون إنها ستمطر اليوم.', 'say', 'Weather', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(21, 'translation_match', 'easy', 'say', 'en', 'يقول', 'base', NULL, NULL, NULL, '"say" is the base verb for expressing words.'),
(21, 'reverse_translation', 'easy', 'يقول', 'ar', 'say', 'base', NULL, NULL, NULL, 'The Arabic verb "يقول" translates to "say".'),
(21, 'sentence_completion', 'easy', 'Please ___ hello to your father.', 'en', 'say', 'base', 'Please ___ hello to your father.', 'Please say hello to your father.', 1, 'Use the base form "say" for imperatives.'),
(21, 'sentence_completion', 'easy', 'He always ___ "please".', 'en', 'says', 'thirdPerson', 'He always ___ "please".', 'He always says "please".', 2, 'Use "says" for third-person singular present.'),
(21, 'sentence_completion', 'easy', 'Yesterday, she ___ she was tired.', 'en', 'said', 'past', 'Yesterday, she ___ she was tired.', 'Yesterday, she said she was tired.', 3, 'Use "said" for the past tense.'),
(21, 'sentence_completion', 'easy', 'What are you ___?', 'en', 'saying', 'gerund', 'What are you ___?', 'What are you saying?', 3, 'Use "saying" for the present continuous.'),
(21, 'sentence_completion', 'easy', 'I have already ___ everything.', 'en', 'said', 'participle', 'I have already ___ everything.', 'I have already said everything.', 3, 'Use "said" as the past participle.'),
(21, 'sentence_completion', 'easy', 'They ___ that the movie is good.', 'en', 'say', 'base', 'They ___ that the movie is good.', 'They say that the movie is good.', 1, 'Use "say" for plural subjects.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(161, 'يسمع'), (161, 'يرى'), (161, 'يمشي'), (161, 'يأكل'), (161, 'يشرب'), (161, 'ينام'), (161, 'يذهب'), (161, 'يأتي'), (161, 'يفعل'), (161, 'يأخذ'),
(162, 'tell'), (162, 'speak'), (162, 'talk'), (162, 'hear'), (162, 'see'), (162, 'walk'), (162, 'eat'), (162, 'drink'), (162, 'sleep'), (162, 'go'),
(163, 'says'), (163, 'said'), (163, 'saying'), (163, 'tells'), (163, 'told'), (163, 'speaks'), (163, 'spoke'), (163, 'talks'), (163, 'talked'), (163, 'hearing'),
(164, 'say'), (164, 'said'), (164, 'saying'), (164, 'tell'), (164, 'tells'), (164, 'told'), (164, 'speak'), (164, 'speaks'), (164, 'talk'), (164, 'talks'),
(165, 'say'), (165, 'says'), (165, 'saying'), (165, 'tell'), (165, 'tells'), (165, 'told'), (165, 'speak'), (165, 'speaks'), (165, 'talk'), (165, 'talked'),
(166, 'say'), (166, 'says'), (166, 'said'), (166, 'tell'), (166, 'telling'), (166, 'told'), (166, 'speak'), (166, 'speaking'), (166, 'talk'), (166, 'talking'),
(167, 'say'), (167, 'says'), (167, 'saying'), (167, 'tell'), (167, 'tells'), (167, 'told'), (167, 'speak'), (167, 'speaks'), (167, 'talk'), (167, 'talks'),
(168, 'says'), (168, 'said'), (168, 'saying'), (168, 'tell'), (168, 'tells'), (168, 'told'), (168, 'speak'), (168, 'speaks'), (168, 'talk'), (168, 'talks');

-- =============================================================================
-- WORD 22: her
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (22, 'her', 'لها / ـها', 'pronoun', 'Used as the object of a verb or preposition to refer to a female person.', 'تستخدم كمفعول به لفعل أو حرف جر للإشارة إلى أنثى.', 'لها / ـها', '["خاصتها", "إياها"]', '{"object": "her", "possessive": "her"}', '/hɜːr/', 'her.mp3', '{"synonyms": [], "antonyms": ["him"], "word_family": ["hers"]}', 'Can be an object pronoun or a possessive determiner.', 'Beginner', 22);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(22, 'I saw {her} at school.', 'رأيتها في المدرسة.', 'her', 'Social', 'Easy', 1, 1),
(22, 'This is {her} book.', 'هذا كتابها.', 'her', 'Possession', 'Easy', 0, 2),
(22, 'Give it to {her}.', 'أعطها إياه.', 'her', 'Giving', 'Easy', 0, 3),
(22, 'I like {her} new car.', 'يعجبني سيارتها الجديدة.', 'her', 'Possession', 'Easy', 0, 4),
(22, 'Tell {her} the truth.', 'قل لها الحقيقة.', 'her', 'Communication', 'Easy', 0, 5),
(22, 'It is {her} turn to play.', 'إنه دورها في اللعب.', 'her', 'Games', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(22, 'translation_match', 'easy', 'her', 'en', 'لها / ـها', 'object', NULL, NULL, NULL, '"her" refers to a female as an object or possessor.'),
(22, 'reverse_translation', 'easy', 'لها / ـها', 'ar', 'her', 'object', NULL, NULL, NULL, 'The Arabic suffix "ـها" or "لها" translates to "her".'),
(22, 'sentence_completion', 'easy', 'I know ___ very well.', 'en', 'her', 'object', 'I know ___ very well.', 'I know her very well.', 2, 'Use "her" as the object pronoun for a female.'),
(22, 'sentence_completion', 'easy', '___ mother is a doctor.', 'en', 'Her', 'possessive', '___ mother is a doctor.', 'Her mother is a doctor.', 0, 'Use "Her" as a possessive determiner.'),
(22, 'sentence_completion', 'easy', 'Please call ___ tonight.', 'en', 'her', 'object', 'Please call ___ tonight.', 'Please call her tonight.', 2, 'Use "her" as the object of the verb "call".'),
(22, 'sentence_completion', 'easy', 'That is ___ house.', 'en', 'her', 'possessive', 'That is ___ house.', 'That is her house.', 2, 'Use "her" to show possession.'),
(22, 'sentence_completion', 'easy', 'I bought a gift for ___.', 'en', 'her', 'object', 'I bought a gift for ___.', 'I bought a gift for her.', 4, 'Use "her" after the preposition "for".'),
(22, 'sentence_completion', 'easy', '___ eyes are blue.', 'en', 'Her', 'possessive', '___ eyes are blue.', 'Her eyes are blue.', 0, 'Use "Her" to describe a feature belonging to her.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(169, 'له'), (169, 'لي'), (169, 'لنا'), (169, 'لهم'), (169, 'لك'), (169, 'هو'), (169, 'هي'), (169, 'أنا'), (169, 'نحن'), (169, 'هم'),
(170, 'him'), (170, 'his'), (170, 'me'), (170, 'my'), (170, 'us'), (170, 'our'), (170, 'them'), (170, 'their'), (170, 'you'), (170, 'your'),
(171, 'him'), (171, 'his'), (171, 'me'), (171, 'my'), (171, 'us'), (171, 'our'), (171, 'them'), (171, 'their'), (171, 'you'), (171, 'your'),
(172, 'Him'), (172, 'His'), (172, 'Me'), (172, 'My'), (172, 'Us'), (172, 'Our'), (172, 'Them'), (172, 'Their'), (172, 'You'), (172, 'Your'),
(173, 'him'), (173, 'his'), (173, 'me'), (173, 'my'), (173, 'us'), (173, 'our'), (173, 'them'), (173, 'their'), (173, 'you'), (173, 'your'),
(174, 'him'), (174, 'his'), (174, 'me'), (174, 'my'), (174, 'us'), (174, 'our'), (174, 'them'), (174, 'their'), (174, 'you'), (174, 'your'),
(175, 'him'), (175, 'his'), (175, 'me'), (175, 'my'), (175, 'us'), (175, 'our'), (175, 'them'), (175, 'their'), (175, 'you'), (175, 'your'),
(176, 'Him'), (176, 'His'), (176, 'Me'), (176, 'My'), (176, 'Us'), (176, 'Our'), (176, 'Them'), (176, 'Their'), (176, 'You'), (176, 'Your');

-- =============================================================================
-- WORD 23: she
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (23, 'she', 'هي', 'pronoun', 'Used to refer to a woman, girl, or female animal previously mentioned.', 'تستخدم للإشارة إلى امرأة أو فتاة أو حيوان أنثى ذكر سابقاً.', 'هي', '[]', '{"subject": "she", "object": "her", "possessive": "her", "possessive_pronoun": "hers", "reflexive": "herself"}', '/ʃiː/', 'she.mp3', '{"synonyms": [], "antonyms": ["he"], "word_family": []}', 'The third-person singular feminine subject pronoun.', 'Beginner', 23);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(23, '{She} is my sister.', 'هي أختي.', 'she', 'Family', 'Easy', 1, 1),
(23, '{She} works in a hospital.', 'هي تعمل في مستشفى.', 'she', 'Jobs', 'Easy', 0, 2),
(23, 'Is {she} coming to the party?', 'هل هي قادمة إلى الحفلة؟', 'she', 'Social', 'Easy', 0, 3),
(23, '{She} likes to read books.', 'هي تحب قراءة الكتب.', 'she', 'Hobbies', 'Easy', 0, 4),
(23, '{She} is a very kind person.', 'هي شخص طيب جداً.', 'she', 'Personality', 'Easy', 0, 5),
(23, '{She} lives in Cairo.', 'هي تعيش في القاهرة.', 'she', 'Location', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(23, 'translation_match', 'easy', 'she', 'en', 'هي', 'subject', NULL, NULL, NULL, '"she" is the feminine subject pronoun.'),
(23, 'reverse_translation', 'easy', 'هي', 'ar', 'she', 'subject', NULL, NULL, NULL, 'The Arabic "هي" translates to "she" in English.'),
(23, 'sentence_completion', 'easy', '___ is a teacher.', 'en', 'She', 'subject', '___ is a teacher.', 'She is a teacher.', 0, 'Use "She" as the subject for a female person.'),
(23, 'sentence_completion', 'easy', 'Does ___ speak English?', 'en', 'she', 'subject', 'Does ___ speak English?', 'Does she speak English?', 1, 'Use "she" as the subject in a question.'),
(23, 'sentence_completion', 'easy', '___ has a beautiful voice.', 'en', 'She', 'subject', '___ has a beautiful voice.', 'She has a beautiful voice.', 0, 'Use "She" as the subject pronoun.'),
(23, 'sentence_completion', 'easy', '___ is my best friend.', 'en', 'She', 'subject', '___ is my best friend.', 'She is my best friend.', 0, 'Use "She" to refer to a female friend.'),
(23, 'sentence_completion', 'easy', 'Where does ___ live?', 'en', 'she', 'subject', 'Where does ___ live?', 'Where does she live?', 2, 'Use "she" as the subject pronoun.'),
(23, 'sentence_completion', 'easy', '___ is very happy today.', 'en', 'She', 'subject', '___ is very happy today.', 'She is very happy today.', 0, 'Use "She" as the subject pronoun.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(177, 'هو'), (177, 'أنا'), (177, 'نحن'), (177, 'هم'), (177, 'أنت'), (177, 'هذا'), (177, 'ذلك'), (177, 'من'), (177, 'إلى'), (177, 'في'),
(178, 'he'), (178, 'I'), (178, 'we'), (178, 'they'), (178, 'you'), (178, 'it'), (178, 'her'), (178, 'his'), (178, 'him'), (178, 'them'),
(179, 'He'), (179, 'I'), (179, 'We'), (179, 'They'), (179, 'You'), (179, 'It'), (179, 'Her'), (179, 'His'), (179, 'Him'), (179, 'Them'),
(180, 'he'), (180, 'I'), (180, 'we'), (180, 'they'), (180, 'you'), (180, 'it'), (180, 'her'), (180, 'his'), (180, 'him'), (180, 'them'),
(181, 'He'), (181, 'I'), (181, 'We'), (181, 'They'), (181, 'You'), (181, 'It'), (181, 'Her'), (181, 'His'), (181, 'Him'), (181, 'Them'),
(182, 'He'), (182, 'I'), (182, 'We'), (182, 'They'), (182, 'You'), (182, 'It'), (182, 'Her'), (182, 'His'), (182, 'Him'), (182, 'Them'),
(183, 'he'), (183, 'I'), (183, 'we'), (183, 'they'), (183, 'you'), (183, 'it'), (183, 'her'), (183, 'his'), (183, 'him'), (183, 'them'),
(184, 'He'), (184, 'I'), (184, 'We'), (184, 'They'), (184, 'You'), (184, 'It'), (184, 'Her'), (184, 'His'), (184, 'Him'), (184, 'Them');

-- =============================================================================
-- WORD 24: or
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (24, 'or', 'أو', 'conjunction', 'Used to link alternatives.', 'تستخدم للربط بين البدائل.', 'أو', '["أم"]', '{"base": "or"}', '/ɔːr/', 'or.mp3', '{"synonyms": ["alternatively"], "antonyms": [], "word_family": []}', 'Used in questions and negative statements to offer choices.', 'Beginner', 24);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(24, 'Tea {or} coffee?', 'شاي أم قهوة؟', 'or', 'Food', 'Easy', 1, 1),
(24, 'Is it true {or} false?', 'هل هو صح أم خطأ؟', 'or', 'General', 'Easy', 0, 2),
(24, 'Now {or} later?', 'الآن أم لاحقاً؟', 'or', 'Time', 'Easy', 0, 3),
(24, 'Red {or} blue?', 'أحمر أم أزرق؟', 'or', 'Colors', 'Easy', 0, 4),
(24, 'Him {or} her?', 'هو أم هي؟', 'or', 'Social', 'Easy', 0, 5),
(24, 'Left {or} right?', 'يسار أم يمين؟', 'or', 'Direction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(24, 'translation_match', 'easy', 'or', 'en', 'أو', 'base', NULL, NULL, NULL, '"or" is used to present a choice between two things.'),
(24, 'reverse_translation', 'easy', 'أو', 'ar', 'or', 'base', NULL, NULL, NULL, 'The Arabic "أو" translates to "or" in English.'),
(24, 'sentence_completion', 'easy', 'Do you want milk ___ sugar?', 'en', 'or', 'base', 'Do you want milk ___ sugar?', 'Do you want milk or sugar?', 4, 'Use "or" to offer a choice.'),
(24, 'sentence_completion', 'easy', 'Is he a doctor ___ a nurse?', 'en', 'or', 'base', 'Is he a doctor ___ a nurse?', 'Is he a doctor or a nurse?', 4, 'Use "or" to ask about alternatives.'),
(24, 'sentence_completion', 'easy', 'Yes ___ no?', 'en', 'or', 'base', 'Yes ___ no?', 'Yes or no?', 1, 'Common binary choice using "or".'),
(24, 'sentence_completion', 'easy', 'Stop ___ I will call the police.', 'en', 'or', 'base', 'Stop ___ I will call the police.', 'Stop or I will call the police.', 1, 'Use "or" to show a consequence of not doing something.'),
(24, 'sentence_completion', 'easy', 'Is it Monday ___ Tuesday?', 'en', 'or', 'base', 'Is it Monday ___ Tuesday?', 'Is it Monday or Tuesday?', 3, 'Use "or" for choices between days.'),
(24, 'sentence_completion', 'easy', 'Eat it now ___ it will get cold.', 'en', 'or', 'base', 'Eat it now ___ it will get cold.', 'Eat it now or it will get cold.', 3, 'Use "or" to link a condition and a result.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(185, 'و'), (185, 'لكن'), (185, 'إذا'), (185, 'من'), (185, 'إلى'), (185, 'في'), (185, 'على'), (185, 'عن'), (185, 'مع'), (185, 'بـ'),
(186, 'and'), (186, 'but'), (186, 'if'), (186, 'so'), (186, 'yet'), (186, 'for'), (186, 'nor'), (186, 'with'), (186, 'to'), (186, 'of'),
(187, 'and'), (187, 'but'), (187, 'if'), (187, 'so'), (187, 'yet'), (187, 'for'), (187, 'nor'), (187, 'with'), (187, 'to'), (187, 'of'),
(188, 'and'), (188, 'but'), (188, 'if'), (188, 'so'), (188, 'yet'), (188, 'for'), (188, 'nor'), (188, 'with'), (188, 'to'), (188, 'of'),
(189, 'and'), (189, 'but'), (189, 'if'), (189, 'so'), (189, 'yet'), (189, 'for'), (189, 'nor'), (189, 'with'), (189, 'to'), (189, 'of'),
(190, 'and'), (190, 'but'), (190, 'if'), (190, 'so'), (190, 'yet'), (190, 'for'), (190, 'nor'), (190, 'with'), (190, 'to'), (190, 'of'),
(191, 'and'), (191, 'but'), (191, 'if'), (191, 'so'), (191, 'yet'), (191, 'for'), (191, 'nor'), (191, 'with'), (191, 'to'), (191, 'of'),
(192, 'and'), (192, 'but'), (192, 'if'), (192, 'so'), (192, 'yet'), (192, 'for'), (192, 'nor'), (192, 'with'), (192, 'to'), (192, 'of');

-- =============================================================================
-- WORD 25: an
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (25, 'an', 'أداة نكرة', 'article', 'Used before a singular noun starting with a vowel sound.', 'تستخدم قبل الاسم المفرد الذي يبدأ بصوت متحرك.', 'أداة نكرة', '[]', '{"singular": "an"}', '/ən/', 'an.mp3', '{"synonyms": ["one"], "antonyms": ["the"], "word_family": []}', 'Used before vowel sounds (a, e, i, o, u) and silent "h".', 'Beginner', 25);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(25, 'I ate {an} apple.', 'أكلت تفاحة.', 'an', 'Food', 'Easy', 1, 1),
(25, 'He is {an} honest man.', 'إنه رجل صادق.', 'an', 'Personality', 'Easy', 0, 2),
(25, 'She has {an} umbrella.', 'معها مظلة.', 'an', 'Weather', 'Easy', 0, 3),
(25, 'It took {an} hour.', 'استغرق الأمر ساعة.', 'an', 'Time', 'Easy', 0, 4),
(25, 'This is {an} interesting book.', 'هذا كتاب ممتع.', 'an', 'Hobbies', 'Easy', 0, 5),
(25, 'I saw {an} elephant.', 'رأيت فيلاً.', 'an', 'Animals', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(25, 'translation_match', 'easy', 'an', 'en', 'أداة نكرة', 'singular', NULL, NULL, NULL, '"an" is the indefinite article used before vowel sounds.'),
(25, 'reverse_translation', 'easy', 'أداة نكرة', 'ar', 'an', 'singular', NULL, NULL, NULL, 'The English indefinite article for vowel sounds is "an".'),
(25, 'sentence_completion', 'easy', 'I want ___ orange.', 'en', 'an', 'singular', 'I want ___ orange.', 'I want an orange.', 2, 'Use "an" before a word starting with a vowel sound.'),
(25, 'sentence_completion', 'easy', 'He is ___ engineer.', 'en', 'an', 'singular', 'He is ___ engineer.', 'He is an engineer.', 2, 'Use "an" before "engineer" because it starts with "e".'),
(25, 'sentence_completion', 'easy', 'Wait for ___ hour.', 'en', 'an', 'singular', 'Wait for ___ hour.', 'Wait for an hour.', 2, 'Use "an" before "hour" because the "h" is silent.'),
(25, 'sentence_completion', 'easy', 'This is ___ easy test.', 'en', 'an', 'singular', 'This is ___ easy test.', 'This is an easy test.', 2, 'Use "an" before the adjective "easy".'),
(25, 'sentence_completion', 'easy', 'I have ___ idea.', 'en', 'an', 'singular', 'I have ___ idea.', 'I have an idea.', 2, 'Use "an" before "idea".'),
(25, 'sentence_completion', 'easy', 'She is ___ old woman.', 'en', 'an', 'singular', 'She is ___ old woman.', 'She is an old woman.', 2, 'Use "an" before "old".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(193, 'الـ'), (193, 'في'), (193, 'من'), (193, 'إلى'), (193, 'و'), (193, 'هو'), (193, 'أنا'), (193, 'هذا'), (193, 'لا'), (193, 'على'),
(194, 'the'), (194, 'a'), (194, 'some'), (194, 'any'), (194, 'and'), (194, 'of'), (194, 'to'), (194, 'in'), (194, 'is'), (194, 'it'),
(195, 'a'), (195, 'the'), (195, 'some'), (195, 'any'), (195, 'one'), (195, 'and'), (195, 'to'), (195, 'in'), (195, 'is'), (195, 'of'),
(196, 'a'), (196, 'the'), (196, 'some'), (196, 'any'), (196, 'one'), (196, 'and'), (196, 'to'), (196, 'in'), (196, 'is'), (196, 'of'),
(197, 'a'), (197, 'the'), (197, 'some'), (197, 'any'), (197, 'one'), (197, 'and'), (197, 'to'), (197, 'in'), (197, 'is'), (197, 'of'),
(198, 'a'), (198, 'the'), (198, 'some'), (198, 'any'), (198, 'one'), (198, 'and'), (198, 'to'), (198, 'in'), (198, 'is'), (198, 'of'),
(199, 'a'), (199, 'the'), (199, 'some'), (199, 'any'), (199, 'one'), (199, 'and'), (199, 'to'), (199, 'in'), (199, 'is'), (199, 'of'),
(200, 'a'), (200, 'the'), (200, 'some'), (200, 'any'), (200, 'one'), (200, 'and'), (200, 'to'), (200, 'in'), (200, 'is'), (200, 'of');

-- =============================================================================
-- WORD 26: will
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (26, 'will', 'سوف', 'verb', 'Used to express future tense, intent, or prediction.', 'يستخدم للتعبير عن صيغة المستقبل أو النية أو التنبؤ.', 'سوف', '["سـ", "وصية"]', '{"base": "will", "negative": "won''t", "past": "would"}', '/wɪl/', 'will.mp3', '{"synonyms": ["shall", "going to"], "antonyms": [], "word_family": ["willing"]}', 'As a modal verb, it does not change for person (I will, he will).', 'Beginner', 26);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(26, 'I {will} call you tomorrow.', 'سوف أتصل بك غداً.', 'will', 'Communication', 'Easy', 1, 1),
(26, 'It {will} rain later.', 'سوف تمطر لاحقاً.', 'will', 'Weather', 'Easy', 0, 2),
(26, 'We {will} win the game.', 'سوف نفوز بالمباراة.', 'will', 'Sports', 'Easy', 0, 3),
(26, 'She {will} be happy to see you.', 'سوف تكون سعيدة برؤيتك.', 'will', 'Emotion', 'Easy', 0, 4),
(26, 'They {will} arrive at six.', 'سوف يصلون في الساعة السادسة.', 'will', 'Travel', 'Easy', 0, 5),
(26, 'I {won''t} forget your help.', 'لن أنسى مساعدتك.', 'won''t', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(26, 'translation_match', 'easy', 'will', 'en', 'سوف', 'base', NULL, NULL, NULL, '"will" is the primary modal verb for the future tense.'),
(26, 'reverse_translation', 'easy', 'سوف', 'ar', 'will', 'base', NULL, NULL, NULL, 'The Arabic "سوف" or the prefix "سـ" translates to "will".'),
(26, 'sentence_completion', 'easy', 'I ___ see you later.', 'en', 'will', 'base', 'I ___ see you later.', 'I will see you later.', 1, 'Use "will" to indicate a future action.'),
(26, 'sentence_completion', 'easy', 'He ___ not come today.', 'en', 'will', 'base', 'He ___ not come today.', 'He will not come today.', 1, 'Use "will" with "not" for future negation.'),
(26, 'sentence_completion', 'easy', '___ you help me?', 'en', 'Will', 'base', '___ you help me?', 'Will you help me?', 0, 'Use "Will" to start a request or future question.'),
(26, 'sentence_completion', 'easy', 'It ___ be a long journey.', 'en', 'will', 'base', 'It ___ be a long journey.', 'It will be a long journey.', 1, 'Use "will" for predictions.'),
(26, 'sentence_completion', 'easy', 'I ___ do my best.', 'en', 'will', 'base', 'I ___ do my best.', 'I will do my best.', 1, 'Use "will" to express a promise or intent.'),
(26, 'sentence_completion', 'easy', 'They ___ be late.', 'en', 'will', 'base', 'They ___ be late.', 'They will be late.', 1, 'Use "will" for future states.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(201, 'كان'), (201, 'من'), (201, 'في'), (201, 'على'), (201, 'مع'), (201, 'عن'), (201, 'بـ'), (201, 'و'), (201, 'أو'), (201, 'لكن'),
(202, 'was'), (202, 'did'), (202, 'can'), (202, 'must'), (202, 'should'), (202, 'would'), (202, 'may'), (202, 'might'), (202, 'has'), (202, 'is'),
(203, 'was'), (203, 'did'), (203, 'can'), (203, 'must'), (203, 'should'), (203, 'would'), (203, 'may'), (203, 'might'), (203, 'has'), (203, 'is'),
(204, 'was'), (204, 'did'), (204, 'can'), (204, 'must'), (204, 'should'), (204, 'would'), (204, 'may'), (204, 'might'), (204, 'has'), (204, 'is'),
(205, 'Was'), (205, 'Did'), (205, 'Can'), (205, 'Must'), (205, 'Should'), (205, 'Would'), (205, 'May'), (205, 'Might'), (205, 'Has'), (205, 'Is'),
(206, 'was'), (206, 'did'), (206, 'can'), (206, 'must'), (206, 'should'), (206, 'would'), (206, 'may'), (206, 'might'), (206, 'has'), (206, 'is'),
(207, 'was'), (207, 'did'), (207, 'can'), (207, 'must'), (207, 'should'), (207, 'would'), (207, 'may'), (207, 'might'), (207, 'has'), (207, 'is'),
(208, 'was'), (208, 'did'), (208, 'can'), (208, 'must'), (208, 'should'), (208, 'would'), (208, 'may'), (208, 'might'), (208, 'has'), (208, 'is');

-- =============================================================================
-- WORD 27: my
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (27, 'my', 'لي / ـي', 'pronoun', 'Belonging to or associated with the speaker.', 'ينتمي إلى المتحدث أو مرتبط به.', 'لي / ـي', '["خاصتي"]', '{"determiner": "my", "pronoun": "mine"}', '/maɪ/', 'my.mp3', '{"synonyms": [], "antonyms": ["your"], "word_family": ["mine"]}', 'Used as a possessive determiner before a noun.', 'Beginner', 27);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(27, 'This is {my} house.', 'هذا منزلي.', 'my', 'Home', 'Easy', 1, 1),
(27, '{My} name is Ahmed.', 'اسمي أحمد.', 'my', 'Identity', 'Easy', 0, 2),
(27, 'I lost {my} keys.', 'فقدت مفاتيحي.', 'my', 'Possession', 'Easy', 0, 3),
(27, '{My} father is a doctor.', 'أبي طبيب.', 'my', 'Family', 'Easy', 0, 4),
(27, 'I love {my} country.', 'أنا أحب بلدي.', 'my', 'Emotion', 'Easy', 0, 5),
(27, 'Where is {my} phone?', 'أين هاتفي؟', 'my', 'Possession', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(27, 'translation_match', 'easy', 'my', 'en', 'لي / ـي', 'determiner', NULL, NULL, NULL, '"my" is the possessive form for the speaker.'),
(27, 'reverse_translation', 'easy', 'لي / ـي', 'ar', 'my', 'determiner', NULL, NULL, NULL, 'The Arabic suffix "ـي" translates to "my" in English.'),
(27, 'sentence_completion', 'easy', '___ car is red.', 'en', 'My', 'determiner', '___ car is red.', 'My car is red.', 0, 'Use "My" to show that the car belongs to you.'),
(27, 'sentence_completion', 'easy', 'I like ___ new job.', 'en', 'my', 'determiner', 'I like ___ new job.', 'I like my new job.', 2, 'Use "my" before the noun "job".'),
(27, 'sentence_completion', 'easy', 'This is ___ friend, Sarah.', 'en', 'my', 'determiner', 'This is ___ friend, Sarah.', 'This is my friend, Sarah.', 2, 'Use "my" to introduce someone you know.'),
(27, 'sentence_completion', 'easy', '___ head hurts.', 'en', 'My', 'determiner', '___ head hurts.', 'My head hurts.', 0, 'Use "My" for parts of your body.'),
(27, 'sentence_completion', 'easy', 'I need to wash ___ hands.', 'en', 'my', 'determiner', 'I need to wash ___ hands.', 'I need to wash my hands.', 4, 'Use "my" to show possession of hands.'),
(27, 'sentence_completion', 'easy', '___ favorite color is blue.', 'en', 'My', 'determiner', '___ favorite color is blue.', 'My favorite color is blue.', 0, 'Use "My" to express your preference.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(209, 'لك'), (209, 'له'), (209, 'لها'), (209, 'لنا'), (209, 'لهم'), (209, 'هو'), (209, 'هي'), (209, 'أنا'), (209, 'نحن'), (209, 'هم'),
(210, 'your'), (210, 'his'), (210, 'her'), (210, 'its'), (210, 'our'), (210, 'their'), (210, 'me'), (210, 'mine'), (210, 'I'), (210, 'you'),
(211, 'Your'), (211, 'His'), (211, 'Her'), (211, 'Its'), (211, 'Our'), (211, 'Their'), (211, 'Me'), (211, 'Mine'), (211, 'I'), (211, 'You'),
(212, 'your'), (212, 'his'), (212, 'her'), (212, 'its'), (212, 'our'), (212, 'their'), (212, 'me'), (212, 'mine'), (212, 'I'), (212, 'you'),
(213, 'your'), (213, 'his'), (213, 'her'), (213, 'its'), (213, 'our'), (213, 'their'), (213, 'me'), (213, 'mine'), (213, 'I'), (213, 'you'),
(214, 'Your'), (214, 'His'), (214, 'Her'), (214, 'Its'), (214, 'Our'), (214, 'Their'), (214, 'Me'), (214, 'Mine'), (214, 'I'), (214, 'You'),
(215, 'your'), (215, 'his'), (215, 'her'), (215, 'its'), (215, 'our'), (215, 'their'), (215, 'me'), (215, 'mine'), (215, 'I'), (215, 'you'),
(216, 'Your'), (216, 'His'), (216, 'Her'), (216, 'Its'), (216, 'Our'), (216, 'Their'), (216, 'Me'), (216, 'Mine'), (216, 'I'), (216, 'You');

-- =============================================================================
-- WORD 28: one
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (28, 'one', 'واحد', 'number', 'The lowest cardinal number; a single person or thing.', 'أقل عدد أصلي؛ شخص واحد أو شيء واحد.', 'واحد', '["فرد", "شخص ما"]', '{"singular": "one", "plural": "ones"}', '/wʌn/', 'one.mp3', '{"synonyms": ["single", "individual"], "antonyms": ["many", "none"], "word_family": ["once", "only"]}', 'Can be used as a number or a pronoun to avoid repeating a noun.', 'Beginner', 28);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(28, 'I have {one} brother.', 'لي أخ واحد.', 'one', 'Family', 'Easy', 1, 1),
(28, '{One} day, I will travel.', 'يوماً ما، سأسافر.', 'one', 'Time', 'Easy', 0, 2),
(28, 'This is the {one} I want.', 'هذا هو الذي أريده.', 'one', 'Preferences', 'Easy', 0, 3),
(28, 'Only {one} person came.', 'شخص واحد فقط جاء.', 'one', 'Social', 'Easy', 0, 4),
(28, 'Which {one} do you like?', 'أي واحد يعجبك؟', 'one', 'Choices', 'Easy', 0, 5),
(28, 'The little {ones} are sleeping.', 'الصغار نائمون.', 'ones', 'Family', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(28, 'translation_match', 'easy', 'one', 'en', 'واحد', 'singular', NULL, NULL, NULL, '"one" is the number 1.'),
(28, 'reverse_translation', 'easy', 'واحد', 'ar', 'one', 'singular', NULL, NULL, NULL, 'The Arabic "واحد" translates to "one".'),
(28, 'sentence_completion', 'easy', 'I have ___ cat.', 'en', 'one', 'singular', 'I have ___ cat.', 'I have one cat.', 2, 'Use "one" to indicate the quantity of 1.'),
(28, 'sentence_completion', 'easy', '___ of my friends is here.', 'en', 'One', 'singular', '___ of my friends is here.', 'One of my friends is here.', 0, 'Use "One" to refer to a single member of a group.'),
(28, 'sentence_completion', 'easy', 'I like the red ___.', 'en', 'one', 'singular', 'I like the red ___.', 'I like the red one.', 4, 'Use "one" as a pronoun to replace a noun.'),
(28, 'sentence_completion', 'easy', '___ plus ___ is two.', 'en', 'One', 'singular', '___ plus ___ is two.', 'One plus one is two.', 0, 'Basic math using the number "one".'),
(28, 'sentence_completion', 'easy', 'He is the ___ for me.', 'en', 'one', 'singular', 'He is the ___ for me.', 'He is the one for me.', 3, 'Use "one" to mean the specific person.'),
(28, 'sentence_completion', 'easy', 'Which ___ is yours?', 'en', 'one', 'singular', 'Which ___ is yours?', 'Which one is yours?', 1, 'Use "one" to ask about a specific choice.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(217, 'اثنان'), (217, 'ثلاثة'), (217, 'كثير'), (217, 'لا شيء'), (217, 'كل'), (217, 'بعض'), (217, 'أول'), (217, 'آخر'), (217, 'هنا'), (217, 'هناك'),
(218, 'two'), (218, 'three'), (218, 'many'), (218, 'none'), (218, 'all'), (218, 'some'), (218, 'first'), (218, 'last'), (218, 'once'), (218, 'only'),
(219, 'two'), (219, 'three'), (219, 'many'), (219, 'none'), (219, 'all'), (219, 'some'), (219, 'first'), (219, 'last'), (219, 'once'), (219, 'only'),
(220, 'Two'), (220, 'Three'), (220, 'Many'), (220, 'None'), (220, 'All'), (220, 'Some'), (220, 'First'), (220, 'Last'), (220, 'Once'), (220, 'Only'),
(221, 'two'), (221, 'three'), (221, 'many'), (221, 'none'), (221, 'all'), (221, 'some'), (221, 'first'), (221, 'last'), (221, 'once'), (221, 'only'),
(222, 'Two'), (222, 'Three'), (222, 'Many'), (222, 'None'), (222, 'All'), (222, 'Some'), (222, 'First'), (222, 'Last'), (222, 'Once'), (222, 'Only'),
(223, 'two'), (223, 'three'), (223, 'many'), (223, 'none'), (223, 'all'), (223, 'some'), (223, 'first'), (223, 'last'), (223, 'once'), (223, 'only'),
(224, 'two'), (224, 'three'), (224, 'many'), (224, 'none'), (224, 'all'), (224, 'some'), (224, 'first'), (224, 'last'), (224, 'once'), (224, 'only');

-- =============================================================================
-- WORD 29: all
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (29, 'all', 'كل', 'determiner', 'The whole quantity or amount of something.', 'الكمية أو المقدار الكامل لشيء ما.', 'كل', '["جميع"]', '{"base": "all"}', '/ɔːl/', 'all.mp3', '{"synonyms": ["every", "entire", "whole"], "antonyms": ["none", "some"], "word_family": []}', 'Can be used as a determiner, pronoun, or adverb.', 'Beginner', 29);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(29, '{All} the students are here.', 'كل الطلاب هنا.', 'all', 'Education', 'Easy', 1, 1),
(29, 'I ate {all} of it.', 'أكلته كله.', 'all', 'Food', 'Easy', 0, 2),
(29, 'That is {all} for today.', 'هذا كل شيء لهذا اليوم.', 'all', 'Time', 'Easy', 0, 3),
(29, '{All} people need love.', 'كل الناس يحتاجون للحب.', 'all', 'Social', 'Easy', 0, 4),
(29, 'We {all} like music.', 'كلنا نحب الموسيقى.', 'all', 'Hobbies', 'Easy', 0, 5),
(29, 'Is that {all}?', 'هل هذا كل شيء؟', 'all', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(29, 'translation_match', 'easy', 'all', 'en', 'كل', 'base', NULL, NULL, NULL, '"all" refers to the entire group or amount.'),
(29, 'reverse_translation', 'easy', 'كل', 'ar', 'all', 'base', NULL, NULL, NULL, 'The Arabic "كل" translates to "all" in English.'),
(29, 'sentence_completion', 'easy', '___ my friends are kind.', 'en', 'All', 'base', '___ my friends are kind.', 'All my friends are kind.', 0, 'Use "All" to refer to the whole group of friends.'),
(29, 'sentence_completion', 'easy', 'I spent ___ my money.', 'en', 'all', 'base', 'I spent ___ my money.', 'I spent all my money.', 2, 'Use "all" to indicate the total amount of money.'),
(29, 'sentence_completion', 'easy', 'Is that ___ you have?', 'en', 'all', 'base', 'Is that ___ you have?', 'Is that all you have?', 2, 'Use "all" to mean "everything".'),
(29, 'sentence_completion', 'easy', 'We ___ want to go.', 'en', 'all', 'base', 'We ___ want to go.', 'We all want to go.', 1, 'Use "all" after a pronoun for emphasis.'),
(29, 'sentence_completion', 'easy', '___ day long.', 'en', 'All', 'base', '___ day long.', 'All day long.', 0, 'Common phrase meaning the entire day.'),
(29, 'sentence_completion', 'easy', '___ of a sudden.', 'en', 'All', 'base', '___ of a sudden.', 'All of a sudden.', 0, 'Idiomatic expression meaning "suddenly".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(225, 'بعض'), (225, 'لا شيء'), (225, 'واحد'), (225, 'قليل'), (225, 'كثير'), (225, 'نصف'), (225, 'أول'), (225, 'آخر'), (225, 'هنا'), (225, 'هناك'),
(226, 'some'), (226, 'none'), (226, 'one'), (226, 'few'), (226, 'many'), (226, 'half'), (226, 'first'), (226, 'last'), (226, 'only'), (226, 'any'),
(227, 'Some'), (227, 'None'), (227, 'One'), (227, 'Few'), (227, 'Many'), (227, 'Half'), (227, 'First'), (227, 'Last'), (227, 'Only'), (227, 'Any'),
(228, 'some'), (228, 'none'), (228, 'one'), (228, 'few'), (228, 'many'), (228, 'half'), (228, 'first'), (228, 'last'), (228, 'only'), (228, 'any'),
(229, 'some'), (229, 'none'), (229, 'one'), (229, 'few'), (229, 'many'), (229, 'half'), (229, 'first'), (229, 'last'), (229, 'only'), (229, 'any'),
(230, 'some'), (230, 'none'), (230, 'one'), (230, 'few'), (230, 'many'), (230, 'half'), (230, 'first'), (230, 'last'), (230, 'only'), (230, 'any'),
(231, 'Some'), (231, 'None'), (231, 'One'), (231, 'Few'), (231, 'Many'), (231, 'Half'), (231, 'First'), (231, 'Last'), (231, 'Only'), (231, 'Any'),
(232, 'Some'), (232, 'None'), (232, 'One'), (232, 'Few'), (232, 'Many'), (232, 'Half'), (232, 'First'), (232, 'Last'), (232, 'Only'), (232, 'Any');

-- =============================================================================
-- WORD 30: would
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (30, 'would', 'ودّ / قد', 'verb', 'Used to indicate a consequence, a polite request, or a past habit.', 'يستخدم للإشارة إلى نتيجة، أو طلب مهذب، أو عادة في الماضي.', 'ودّ / قد', '["سوف (في الماضي)", "لو"]', '{"base": "would", "negative": "wouldn''t"}', '/wʊd/', 'would.mp3', '{"synonyms": ["will (past)"], "antonyms": [], "word_family": []}', 'Often used in conditional sentences and for politeness.', 'Beginner', 30);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(30, '{Would} you like some tea?', 'هل تود بعض الشاي؟', 'would', 'Social', 'Easy', 1, 1),
(30, 'I {would} go if I could.', 'كنت سأذهب لو استطعت.', 'would', 'Conditionals', 'Easy', 0, 2),
(30, 'He said he {would} help.', 'قال إنه سيساعد.', 'would', 'Communication', 'Easy', 0, 3),
(30, '{Would} you mind opening the window?', 'هل تمانع في فتح النافذة؟', 'would', 'Requests', 'Easy', 0, 4),
(30, 'I {would} like to see him.', 'أود أن أراه.', 'would', 'Preferences', 'Easy', 0, 5),
(30, 'She {wouldn''t} listen to me.', 'لم تكن لتستمع إلي.', 'wouldn''t', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(30, 'translation_match', 'easy', 'would', 'en', 'ودّ / قد', 'base', NULL, NULL, NULL, '"would" is used for polite requests and conditionals.'),
(30, 'reverse_translation', 'easy', 'ودّ / قد', 'ar', 'would', 'base', NULL, NULL, NULL, 'The Arabic "ودّ" or "سـ" (in past context) translates to "would".'),
(30, 'sentence_completion', 'easy', '___ you like to dance?', 'en', 'Would', 'base', '___ you like to dance?', 'Would you like to dance?', 0, 'Use "Would" to make a polite offer.'),
(30, 'sentence_completion', 'easy', 'I ___ love to visit Paris.', 'en', 'would', 'base', 'I ___ love to visit Paris.', 'I would love to visit Paris.', 1, 'Use "would" to express a strong desire.'),
(30, 'sentence_completion', 'easy', 'If I were you, I ___ go.', 'en', 'would', 'base', 'If I were you, I ___ go.', 'If I were you, I would go.', 5, 'Use "would" in the second conditional.'),
(30, 'sentence_completion', 'easy', '___ you please help me?', 'en', 'Would', 'base', '___ you please help me?', 'Would you please help me?', 0, 'Use "Would" for polite requests.'),
(30, 'sentence_completion', 'easy', 'He ___ not do it.', 'en', 'would', 'base', 'He ___ not do it.', 'He would not do it.', 1, 'Use "would" for refusal in the past or conditional.'),
(30, 'sentence_completion', 'easy', 'I knew it ___ happen.', 'en', 'would', 'base', 'I knew it ___ happen.', 'I knew it would happen.', 3, 'Use "would" as the past tense of "will".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(233, 'كان'), (233, 'من'), (233, 'في'), (233, 'على'), (233, 'مع'), (233, 'عن'), (233, 'بـ'), (233, 'و'), (233, 'أو'), (233, 'لكن'),
(234, 'will'), (234, 'can'), (234, 'must'), (234, 'should'), (234, 'do'), (234, 'did'), (234, 'was'), (234, 'is'), (234, 'has'), (234, 'may'),
(235, 'Will'), (235, 'Can'), (235, 'Must'), (235, 'Should'), (235, 'Do'), (235, 'Did'), (235, 'Was'), (235, 'Is'), (235, 'Has'), (235, 'May'),
(236, 'will'), (236, 'can'), (236, 'must'), (236, 'should'), (236, 'do'), (236, 'did'), (236, 'was'), (236, 'is'), (236, 'has'), (236, 'may'),
(237, 'will'), (237, 'can'), (237, 'must'), (237, 'should'), (237, 'do'), (237, 'did'), (237, 'was'), (237, 'is'), (237, 'has'), (237, 'may'),
(238, 'Will'), (238, 'Can'), (238, 'Must'), (238, 'Should'), (238, 'Do'), (238, 'Did'), (238, 'Was'), (238, 'Is'), (238, 'Has'), (238, 'May'),
(239, 'will'), (239, 'can'), (239, 'must'), (239, 'should'), (239, 'do'), (239, 'did'), (239, 'was'), (239, 'is'), (239, 'has'), (239, 'may'),
(240, 'will'), (240, 'can'), (240, 'must'), (240, 'should'), (240, 'do'), (240, 'did'), (240, 'was'), (240, 'is'), (240, 'has'), (240, 'may');