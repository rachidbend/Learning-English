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
-- WORD 6: I (ID: 6, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (6, 'I', 'أنا', 'pron.', 'Used by a speaker to refer to himself or herself.', 'يستخدمه المتحدث للإشارة إلى نفسه.', 'أنا', '[]', '{"subject": "I", "object": "me", "possessive": "my", "possessive_pronoun": "mine", "reflexive": "myself"}', '/aɪ/', 'i.mp3', '{"synonyms": [], "antonyms": [], "word_family": []}', 'Always capitalized in English, regardless of its position in a sentence.', 'Beginner', 8);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(6, '{I} am a student.', 'أنا طالب.', 'I', 'Identity', 'Easy', 1, 1),
(6, '{I} like coffee.', 'أنا أحب القهوة.', 'I', 'Preferences', 'Easy', 0, 2),
(6, '{I} live in a big city.', 'أنا أعيش في مدينة كبيرة.', 'I', 'Location', 'Easy', 0, 3),
(6, '{I} have a brother.', 'لي أخ.', 'I', 'Family', 'Easy', 0, 4),
(6, '{I} can speak English.', 'أنا أستطيع التحدث بالإنجليزية.', 'I', 'Ability', 'Easy', 0, 5),
(6, '{I} am happy today.', 'أنا سعيد اليوم.', 'I', 'Emotion', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(6, 'translation_match', 'easy', 'I', 'en', 'أنا', 'subject', NULL, NULL, NULL, '"I" is the first-person singular subject pronoun.'),
(6, 'reverse_translation', 'easy', 'أنا', 'ar', 'I', 'subject', NULL, NULL, NULL, 'The Arabic "أنا" translates to "I" in English.'),
(6, 'sentence_completion', 'easy', '___ am hungry.', 'en', 'I', 'subject', '___ am hungry.', 'I am hungry.', 0, 'Use "I" as the subject before "am".'),
(6, 'sentence_completion', 'easy', '___ don''t know.', 'en', 'I', 'subject', '___ don''t know.', 'I don''t know.', 0, 'Use "I" as the subject for a negative statement.'),
(6, 'sentence_completion', 'easy', '___ want to go home.', 'en', 'I', 'subject', '___ want to go home.', 'I want to go home.', 0, 'Use "I" to express a personal desire.'),
(6, 'sentence_completion', 'easy', '___ think you are right.', 'en', 'I', 'subject', '___ think you are right.', 'I think you are right.', 0, 'Use "I" to introduce an opinion.'),
(6, 'sentence_completion', 'easy', '___ saw a movie yesterday.', 'en', 'I', 'subject', '___ saw a movie yesterday.', 'I saw a movie yesterday.', 0, 'Use "I" as the subject in the past tense.'),
(6, 'sentence_completion', 'easy', '___ am from Egypt.', 'en', 'I', 'subject', '___ am from Egypt.', 'I am from Egypt.', 0, 'Use "I" to state your origin.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(41, 'هو'), (41, 'هي'), (41, 'نحن'), (41, 'هم'), (41, 'أنت'), (41, 'هذا'), (41, 'ذلك'), (41, 'من'), (41, 'إلى'), (41, 'في'),
(42, 'you'), (42, 'he'), (42, 'she'), (42, 'it'), (42, 'we'), (42, 'they'), (42, 'my'), (42, 'me'), (42, 'mine'), (42, 'myself'),
(43, 'Me'), (43, 'My'), (43, 'Mine'), (43, 'Myself'), (43, 'You'), (43, 'He'), (43, 'She'), (43, 'It'), (43, 'We'), (43, 'They'),
(44, 'Me'), (44, 'My'), (44, 'Mine'), (44, 'Myself'), (44, 'You'), (44, 'He'), (44, 'She'), (44, 'It'), (44, 'We'), (44, 'They'),
(45, 'Me'), (45, 'My'), (45, 'Mine'), (45, 'Myself'), (45, 'You'), (45, 'He'), (45, 'She'), (45, 'It'), (45, 'We'), (45, 'They'),
(46, 'Me'), (46, 'My'), (46, 'Mine'), (46, 'Myself'), (46, 'You'), (46, 'He'), (46, 'She'), (46, 'It'), (46, 'We'), (46, 'They'),
(47, 'Me'), (47, 'My'), (47, 'Mine'), (47, 'Myself'), (47, 'You'), (47, 'He'), (47, 'She'), (47, 'It'), (47, 'We'), (47, 'They'),
(48, 'Me'), (48, 'My'), (48, 'Mine'), (48, 'Myself'), (48, 'You'), (48, 'He'), (48, 'She'), (48, 'It'), (48, 'We'), (48, 'They');

-- =============================================================================
-- WORD 7: you (ID: 7, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (7, 'you', 'أنت', 'pron.', 'Used to refer to the person or people that the speaker is addressing.', 'يستخدم للإشارة إلى الشخص أو الأشخاص الذين يخاطبهم المتحدث.', 'أنت', '["أنتم", "أنتِ", "أنتما", "أنتن"]', '{"subject": "you", "object": "you", "possessive": "your", "possessive_pronoun": "yours", "reflexive": "yourself"}', '/juː/', 'you.mp3', '{"synonyms": [], "antonyms": [], "word_family": ["your", "yours", "yourself"]}', 'Used for both singular and plural address in English.', 'Beginner', 9);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(7, '{You} are my friend.', 'أنت صديقي.', 'you', 'Social', 'Easy', 1, 1),
(7, 'I will call {you} later.', 'سأتصل بك لاحقاً.', 'you', 'Communication', 'Easy', 0, 2),
(7, 'Can {you} help me?', 'هل يمكنك مساعدتي؟', 'you', 'Requests', 'Easy', 0, 3),
(7, '{You} look tired.', 'تبدو متعباً.', 'you', 'State', 'Easy', 0, 4),
(7, 'Thank {you} very much.', 'شكراً جزيلاً لك.', 'you', 'Social', 'Easy', 0, 5),
(7, 'Where do {you} live?', 'أين تعيش؟', 'you', 'Location', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(7, 'translation_match', 'easy', 'you', 'en', 'أنت', 'subject', NULL, NULL, NULL, '"you" is the second-person pronoun.'),
(7, 'reverse_translation', 'easy', 'أنت', 'ar', 'you', 'subject', NULL, NULL, NULL, 'The Arabic "أنت" translates to "you" in English.'),
(7, 'sentence_completion', 'easy', '___ are very kind.', 'en', 'You', 'subject', '___ are very kind.', 'You are very kind.', 0, 'Use "You" as the subject pronoun.'),
(7, 'sentence_completion', 'easy', 'I love ___ .', 'en', 'you', 'object', 'I love ___ .', 'I love you.', 2, 'Use "you" as the object pronoun.'),
(7, 'sentence_completion', 'easy', 'Do ___ want some tea?', 'en', 'you', 'subject', 'Do ___ want some tea?', 'Do you want some tea?', 1, 'Use "you" as the subject in a question.'),
(7, 'sentence_completion', 'easy', 'I can see ___ .', 'en', 'you', 'object', 'I can see ___ .', 'I can see you.', 3, 'Use "you" as the object of the verb "see".'),
(7, 'sentence_completion', 'easy', '___ must study hard.', 'en', 'You', 'subject', '___ must study hard.', 'You must study hard.', 0, 'Use "You" to give advice or a command.'),
(7, 'sentence_completion', 'easy', 'Are ___ ready?', 'en', 'you', 'subject', 'Are ___ ready?', 'Are you ready?', 1, 'Use "you" as the subject after the verb "be" in a question.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(49, 'أنا'), (49, 'هو'), (49, 'هي'), (49, 'نحن'), (49, 'هم'), (49, 'هذا'), (49, 'ذلك'), (49, 'من'), (49, 'إلى'), (49, 'في'),
(50, 'I'), (50, 'he'), (50, 'she'), (50, 'it'), (50, 'we'), (50, 'they'), (50, 'my'), (50, 'me'), (50, 'mine'), (50, 'myself'),
(51, 'I'), (51, 'He'), (51, 'She'), (51, 'It'), (51, 'We'), (51, 'They'), (51, 'Me'), (51, 'Him'), (51, 'Her'), (51, 'Them'),
(52, 'I'), (52, 'me'), (52, 'my'), (52, 'mine'), (52, 'he'), (52, 'him'), (52, 'his'), (52, 'she'), (52, 'her'), (52, 'them'),
(53, 'I'), (53, 'me'), (53, 'my'), (53, 'mine'), (53, 'he'), (53, 'him'), (53, 'his'), (53, 'she'), (53, 'her'), (53, 'them'),
(54, 'I'), (54, 'me'), (54, 'my'), (54, 'mine'), (54, 'he'), (54, 'him'), (54, 'his'), (54, 'she'), (54, 'her'), (54, 'them'),
(55, 'I'), (55, 'He'), (55, 'She'), (55, 'It'), (55, 'We'), (55, 'They'), (55, 'Me'), (55, 'Him'), (55, 'Her'), (55, 'Them'),
(56, 'I'), (56, 'me'), (56, 'my'), (56, 'mine'), (56, 'he'), (56, 'him'), (56, 'his'), (56, 'she'), (56, 'her'), (56, 'them');

-- =============================================================================
-- WORD 8: have (ID: 8, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (8, 'have', 'يملك', 'v.', 'To possess, own, or hold.', 'أن يمتلك، يملك، أو يحوز.', 'يملك', '["لديه", "عنده", "يتناول"]', '{"base": "have", "thirdPerson": "has", "past": "had", "participle": "had", "gerund": "having"}', '/hæv/', 'have.mp3', '{"synonyms": ["possess", "own"], "antonyms": ["lack", "lose"], "word_family": []}', 'Also used as an auxiliary verb in perfect tenses.', 'Beginner', 11);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(8, 'I {have} a pen.', 'لدي قلم.', 'have', 'Possession', 'Easy', 1, 1),
(8, 'She {has} a cat.', 'هي تملك قطة.', 'has', 'Animals', 'Easy', 0, 2),
(8, 'We {had} lunch at noon.', 'تناولنا الغداء ظهراً.', 'had', 'Food', 'Easy', 0, 3),
(8, 'I am {having} a good time.', 'أنا أقضي وقتاً ممتعاً.', 'having', 'Emotion', 'Easy', 0, 4),
(8, 'They {have} three children.', 'لديهم ثلاثة أطفال.', 'have', 'Family', 'Easy', 0, 5),
(8, 'He {has} to go now.', 'يجب عليه الذهاب الآن.', 'has', 'Obligation', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(8, 'translation_match', 'easy', 'have', 'en', 'يملك', 'base', NULL, NULL, NULL, '"have" is the base form for possession.'),
(8, 'reverse_translation', 'easy', 'يملك', 'ar', 'have', 'base', NULL, NULL, NULL, 'The Arabic "يملك" translates to "have".'),
(8, 'sentence_completion', 'easy', 'I ___ a big family.', 'en', 'have', 'base', 'I ___ a big family.', 'I have a big family.', 1, 'Use "have" with the pronoun "I".'),
(8, 'sentence_completion', 'easy', 'She ___ a blue car.', 'en', 'has', 'thirdPerson', 'She ___ a blue car.', 'She has a blue car.', 1, 'Use "has" for third-person singular.'),
(8, 'sentence_completion', 'easy', 'We ___ a meeting yesterday.', 'en', 'had', 'past', 'We ___ a meeting yesterday.', 'We had a meeting yesterday.', 1, 'Use "had" for past tense.'),
(8, 'sentence_completion', 'easy', 'They ___ many friends.', 'en', 'have', 'base', 'They ___ many friends.', 'They have many friends.', 1, 'Use "have" for plural subjects.'),
(8, 'sentence_completion', 'easy', 'He ___ finished his work.', 'en', 'has', 'thirdPerson', 'He ___ finished his work.', 'He has finished his work.', 1, 'Use "has" as an auxiliary verb for "he".'),
(8, 'sentence_completion', 'easy', 'I am ___ dinner now.', 'en', 'having', 'gerund', 'I am ___ dinner now.', 'I am having dinner now.', 2, 'Use "having" for continuous actions.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(57, 'يفعل'), (57, 'يذهب'), (57, 'يأكل'), (57, 'يرى'), (57, 'يأخذ'), (57, 'يعطي'), (57, 'يقول'), (57, 'يأتي'), (57, 'يكون'), (57, 'يصنع'),
(58, 'do'), (58, 'go'), (58, 'see'), (58, 'take'), (58, 'give'), (58, 'say'), (58, 'come'), (58, 'be'), (58, 'make'), (58, 'get'),
(59, 'has'), (59, 'had'), (59, 'having'), (59, 'do'), (59, 'does'), (59, 'did'), (59, 'be'), (59, 'is'), (59, 'am'), (59, 'are'),
(60, 'have'), (60, 'had'), (60, 'having'), (60, 'do'), (60, 'does'), (60, 'did'), (60, 'be'), (60, 'is'), (60, 'am'), (60, 'are'),
(61, 'have'), (61, 'has'), (61, 'having'), (61, 'do'), (61, 'does'), (61, 'did'), (61, 'be'), (61, 'is'), (61, 'am'), (61, 'are'),
(62, 'has'), (62, 'had'), (62, 'having'), (62, 'do'), (62, 'does'), (62, 'did'), (62, 'be'), (62, 'is'), (62, 'am'), (62, 'are'),
(63, 'have'), (63, 'had'), (63, 'having'), (63, 'do'), (63, 'does'), (63, 'did'), (63, 'be'), (63, 'is'), (63, 'am'), (63, 'are'),
(64, 'have'), (64, 'has'), (64, 'had'), (64, 'do'), (64, 'does'), (64, 'did'), (64, 'be'), (64, 'is'), (64, 'am'), (64, 'are');

-- =============================================================================
-- WORD 9: to (ID: 9, POS: prep., infinitive marker)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (9, 'to', 'إلى', 'prep.', 'Expressing motion in the direction of a particular location.', 'التعبير عن الحركة في اتجاه موقع معين.', 'إلى', '["لـ", "أن"]', '{"base": "to"}', '/tuː/', 'to.mp3', '{"synonyms": ["towards"], "antonyms": ["from"], "word_family": []}', 'Used both as a preposition and as part of an infinitive verb.', 'Beginner', 12);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(9, 'I am going {to} school.', 'أنا ذاهب إلى المدرسة.', 'to', 'Education', 'Easy', 1, 1),
(9, 'He traveled {to} London.', 'سافر إلى لندن.', 'to', 'Travel', 'Easy', 0, 2),
(9, 'Please talk {to} me.', 'من فضلك تحدث إلي.', 'to', 'Communication', 'Easy', 0, 3),
(9, 'I want {to} eat.', 'أريد أن آكل.', 'to', 'Needs', 'Easy', 0, 4),
(9, 'Give it {to} her.', 'أعطها إياها.', 'to', 'Giving', 'Easy', 0, 5),
(9, 'Welcome {to} our home.', 'مرحباً بكم في منزلنا.', 'to', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(9, 'translation_match', 'easy', 'to', 'en', 'إلى', 'to', NULL, NULL, NULL, '"to" is a preposition indicating direction.'),
(9, 'reverse_translation', 'easy', 'إلى', 'ar', 'to', 'to', NULL, NULL, NULL, 'The Arabic "إلى" translates to "to" in English.'),
(9, 'sentence_completion', 'easy', 'Go ___ the door.', 'en', 'to', 'to', 'Go ___ the door.', 'Go to the door.', 1, 'Use "to" to indicate direction.'),
(9, 'sentence_completion', 'easy', 'I like ___ swim.', 'en', 'to', 'to', 'I like ___ swim.', 'I like to swim.', 2, 'Use "to" before the base form of a verb (infinitive).'),
(9, 'sentence_completion', 'easy', 'Listen ___ the music.', 'en', 'to', 'to', 'Listen ___ the music.', 'Listen to the music.', 1, 'The verb "listen" is followed by "to".'),
(9, 'sentence_completion', 'easy', 'Send it ___ him.', 'en', 'to', 'to', 'Send it ___ him.', 'Send it to him.', 2, 'Use "to" to indicate the recipient.'),
(9, 'sentence_completion', 'easy', 'Back ___ work.', 'en', 'to', 'to', 'Back ___ work.', 'Back to work.', 1, 'Use "to" with "back" to indicate returning.'),
(9, 'sentence_completion', 'easy', 'Happy birthday ___ you.', 'en', 'to', 'to', 'Happy birthday ___ you.', 'Happy birthday to you.', 2, 'Common phrase using "to".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(65, 'من'), (65, 'في'), (65, 'على'), (65, 'عن'), (65, 'مع'), (65, 'بـ'), (65, 'لـ'), (65, 'أو'), (65, 'لكن'), (65, 'إذا'),
(66, 'from'), (66, 'in'), (66, 'on'), (66, 'at'), (66, 'by'), (66, 'with'), (66, 'for'), (66, 'of'), (66, 'and'), (66, 'but'),
(67, 'from'), (67, 'in'), (67, 'on'), (67, 'at'), (67, 'by'), (67, 'with'), (67, 'for'), (67, 'of'), (67, 'and'), (67, 'but'),
(68, 'from'), (68, 'in'), (68, 'on'), (68, 'at'), (68, 'by'), (68, 'with'), (68, 'for'), (68, 'of'), (68, 'and'), (68, 'but'),
(69, 'from'), (69, 'in'), (69, 'on'), (69, 'at'), (69, 'by'), (69, 'with'), (69, 'for'), (69, 'of'), (69, 'and'), (69, 'but'),
(70, 'from'), (70, 'in'), (70, 'on'), (70, 'at'), (70, 'by'), (70, 'with'), (70, 'for'), (70, 'of'), (70, 'and'), (70, 'but'),
(71, 'from'), (71, 'in'), (71, 'on'), (71, 'at'), (71, 'by'), (71, 'with'), (71, 'for'), (71, 'of'), (71, 'and'), (71, 'but'),
(72, 'from'), (72, 'in'), (72, 'on'), (72, 'at'), (72, 'by'), (72, 'with'), (72, 'for'), (72, 'of'), (72, 'and'), (72, 'but');

-- =============================================================================
-- WORD 10: he (ID: 10, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (10, 'he', 'هو', 'pron.', 'Used to refer to a man, boy, or male animal previously mentioned.', 'يستخدم للإشارة إلى رجل أو ولد أو حيوان ذكر ذكر سابقاً.', 'هو', '[]', '{"subject": "he", "object": "him", "possessive": "his", "possessive_pronoun": "his", "reflexive": "himself"}', '/hiː/', 'he.mp3', '{"synonyms": [], "antonyms": ["she"], "word_family": []}', 'The third-person singular masculine subject pronoun.', 'Beginner', 16);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(10, '{He} is my brother.', 'هو أخي.', 'he', 'Family', 'Easy', 1, 1),
(10, 'I saw {him} at the park.', 'رأيته في الحديقة.', 'him', 'Social', 'Easy', 0, 2),
(10, 'This is {his} car.', 'هذه سيارته.', 'his', 'Possession', 'Easy', 0, 3),
(10, 'The book is {his}.', 'الكتاب له.', 'his', 'Possession', 'Easy', 0, 4),
(10, 'He fixed the bike {himself}.', 'أصلح الدراجة بنفسه.', 'himself', 'Action', 'Easy', 0, 5),
(10, '{He} likes to play football.', 'هو يحب لعب كرة القدم.', 'he', 'Hobbies', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(10, 'translation_match', 'easy', 'he', 'en', 'هو', 'subject', NULL, NULL, NULL, '"he" is the masculine subject pronoun.'),
(10, 'reverse_translation', 'easy', 'هو', 'ar', 'he', 'subject', NULL, NULL, NULL, 'The Arabic "هو" translates to "he" in English.'),
(10, 'sentence_completion', 'easy', '___ is a doctor.', 'en', 'He', 'subject', '___ is a doctor.', 'He is a doctor.', 0, 'Use "He" as the subject for a male person.'),
(10, 'sentence_completion', 'easy', 'Give the book to ___.', 'en', 'him', 'object', 'Give the book to ___.', 'Give the book to him.', 4, 'Use "him" as the object pronoun.'),
(10, 'sentence_completion', 'easy', '___ father is a teacher.', 'en', 'His', 'possessive', '___ father is a teacher.', 'His father is a teacher.', 0, 'Use "His" to show possession for a male.'),
(10, 'sentence_completion', 'easy', 'He lives by ___.', 'en', 'himself', 'reflexive', 'He lives by ___.', 'He lives by himself.', 3, 'Use "himself" to mean alone or without help.'),
(10, 'sentence_completion', 'easy', 'Is that bag ___?', 'en', 'his', 'possessive_pronoun', 'Is that bag ___?', 'Is that bag his?', 3, 'Use "his" as a possessive pronoun at the end of a sentence.'),
(10, 'sentence_completion', 'easy', '___ is very tall.', 'en', 'He', 'subject', '___ is very tall.', 'He is very tall.', 0, 'Use "He" as the subject pronoun.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(73, 'هي'), (73, 'أنا'), (73, 'نحن'), (73, 'هم'), (73, 'أنت'), (73, 'هذا'), (73, 'ذلك'), (73, 'من'), (73, 'إلى'), (73, 'في'),
(74, 'she'), (74, 'I'), (74, 'we'), (74, 'they'), (74, 'you'), (74, 'it'), (74, 'him'), (74, 'his'), (74, 'her'), (74, 'them'),
(75, 'She'), (75, 'I'), (75, 'We'), (75, 'They'), (75, 'You'), (75, 'It'), (75, 'Him'), (75, 'His'), (75, 'Her'), (75, 'Them'),
(76, 'he'), (76, 'his'), (76, 'himself'), (76, 'she'), (76, 'her'), (76, 'it'), (76, 'me'), (76, 'us'), (76, 'them'), (76, 'you'),
(77, 'He'), (77, 'Him'), (77, 'Himself'), (77, 'She'), (77, 'Her'), (77, 'It'), (77, 'My'), (77, 'Our'), (77, 'Their'), (77, 'Your'),
(78, 'he'), (78, 'him'), (78, 'his'), (78, 'she'), (78, 'her'), (78, 'herself'), (78, 'myself'), (78, 'yourself'), (78, 'itself'), (78, 'themselves'),
(79, 'he'), (79, 'him'), (79, 'himself'), (79, 'she'), (79, 'her'), (79, 'hers'), (79, 'mine'), (79, 'ours'), (79, 'theirs'), (79, 'yours'),
(80, 'She'), (80, 'I'), (80, 'We'), (80, 'They'), (80, 'You'), (80, 'It'), (80, 'Him'), (80, 'His'), (80, 'Her'), (80, 'Them');

-- =============================================================================
-- WORD 11: with (ID: 11, POS: prep.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (11, 'with', 'مع', 'prep.', 'Accompanied by another person or thing; or using an instrument.', 'برفقة شخص أو شيء آخر؛ أو باستخدام أداة.', 'مع', '["بواسطة", "بـ"]', '{"base": "with"}', '/wɪð/', 'with.mp3', '{"synonyms": ["alongside"], "antonyms": ["without"], "word_family": []}', 'Used to indicate accompaniment, instrument, or manner.', 'Beginner', 17);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(11, 'I am {with} my friend.', 'أنا مع صديقي.', 'with', 'Social', 'Easy', 1, 1),
(11, 'Coffee {with} milk, please.', 'قهوة مع حليب، من فضلك.', 'with', 'Food', 'Easy', 0, 2),
(11, 'He writes {with} a pen.', 'يكتب بقلم.', 'with', 'Tools', 'Easy', 0, 3),
(11, 'Come {with} me.', 'تعال معي.', 'with', 'Social', 'Easy', 0, 4),
(11, 'A girl {with} blue eyes.', 'فتاة ذات عيون زرقاء.', 'with', 'Description', 'Easy', 0, 5),
(11, 'Handle {with} care.', 'تعامل بعناية.', 'with', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(11, 'translation_match', 'easy', 'with', 'en', 'مع', 'base', NULL, NULL, NULL, '"with" is the primary preposition for accompaniment.'),
(11, 'reverse_translation', 'easy', 'مع', 'ar', 'with', 'base', NULL, NULL, NULL, 'The Arabic "مع" translates to "with" in English.'),
(11, 'sentence_completion', 'easy', 'I live ___ my parents.', 'en', 'with', 'base', 'I live ___ my parents.', 'I live with my parents.', 2, 'Use "with" to show accompaniment.'),
(11, 'sentence_completion', 'easy', 'Cut the bread ___ a knife.', 'en', 'with', 'base', 'Cut the bread ___ a knife.', 'Cut the bread with a knife.', 3, 'Use "with" to indicate the tool used.'),
(11, 'sentence_completion', 'easy', 'Are you ___ us?', 'en', 'with', 'base', 'Are you ___ us?', 'Are you with us?', 2, 'Use "with" to ask about agreement or presence.'),
(11, 'sentence_completion', 'easy', 'He is angry ___ me.', 'en', 'with', 'base', 'He is angry ___ me.', 'He is angry with me.', 3, 'Use "with" after certain adjectives like "angry".'),
(11, 'sentence_completion', 'easy', 'Tea ___ sugar.', 'en', 'with', 'base', 'Tea ___ sugar.', 'Tea with sugar.', 1, 'Use "with" for ingredients or additions.'),
(11, 'sentence_completion', 'easy', 'Walk ___ me.', 'en', 'with', 'base', 'Walk ___ me.', 'Walk with me.', 1, 'Use "with" for walking together.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(81, 'من'), (81, 'إلى'), (81, 'في'), (81, 'على'), (81, 'عن'), (81, 'بـ'), (81, 'لـ'), (81, 'بدون'), (81, 'تحت'), (81, 'فوق'),
(82, 'without'), (82, 'from'), (82, 'to'), (82, 'in'), (82, 'on'), (82, 'at'), (82, 'by'), (82, 'for'), (82, 'about'), (82, 'of'),
(83, 'without'), (83, 'from'), (83, 'to'), (83, 'in'), (83, 'on'), (83, 'at'), (83, 'by'), (83, 'for'), (83, 'about'), (83, 'of'),
(84, 'without'), (84, 'from'), (84, 'to'), (84, 'in'), (84, 'on'), (84, 'at'), (84, 'by'), (84, 'for'), (84, 'about'), (84, 'of'),
(85, 'without'), (85, 'from'), (85, 'to'), (85, 'in'), (85, 'on'), (85, 'at'), (85, 'by'), (85, 'for'), (85, 'about'), (85, 'of'),
(86, 'without'), (86, 'from'), (86, 'to'), (86, 'in'), (86, 'on'), (86, 'at'), (86, 'by'), (86, 'for'), (86, 'about'), (86, 'of'),
(87, 'without'), (87, 'from'), (87, 'to'), (87, 'in'), (87, 'on'), (87, 'at'), (87, 'by'), (87, 'for'), (87, 'about'), (87, 'of'),
(88, 'without'), (88, 'from'), (88, 'to'), (88, 'in'), (88, 'on'), (88, 'at'), (88, 'by'), (88, 'for'), (88, 'about'), (88, 'of');

-- =============================================================================
-- WORD 12: we (ID: 12, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (12, 'we', 'نحن', 'pron.', 'Used by a speaker to refer to himself or herself and one or more other people as the subject.', 'يستخدمه المتحدث للإشارة إلى نفسه وشخص آخر أو أكثر كفاعل.', 'نحن', '[]', '{"subject": "we", "object": "us", "possessive": "our", "possessive_pronoun": "ours", "reflexive": "ourselves"}', '/wiː/', 'we.mp3', '{"synonyms": [], "antonyms": [], "word_family": ["us", "our", "ours", "ourselves"]}', 'The first-person plural subject pronoun.', 'Beginner', 21);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(12, '{We} are happy.', 'نحن سعداء.', 'we', 'Emotion', 'Easy', 1, 1),
(12, '{We} live in a small town.', 'نحن نعيش في بلدة صغيرة.', 'we', 'Location', 'Easy', 0, 2),
(12, '{We} have a meeting today.', 'لدينا اجتماع اليوم.', 'we', 'Work', 'Easy', 0, 3),
(12, '{We} like to play tennis.', 'نحن نحب لعب التنس.', 'we', 'Hobbies', 'Easy', 0, 4),
(12, '{We} saw a movie last night.', 'شاهدنا فيلماً ليلة أمس.', 'we', 'Entertainment', 'Easy', 0, 5),
(12, '{We} are learning English.', 'نحن نتعلم الإنجليزية.', 'we', 'Education', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(12, 'translation_match', 'easy', 'we', 'en', 'نحن', 'subject', NULL, NULL, NULL, '"we" is the first-person plural subject pronoun.'),
(12, 'reverse_translation', 'easy', 'نحن', 'ar', 'we', 'subject', NULL, NULL, NULL, 'The Arabic "نحن" translates to "we" in English.'),
(12, 'sentence_completion', 'easy', '___ are going to the park.', 'en', 'We', 'subject', '___ are going to the park.', 'We are going to the park.', 0, 'Use "We" as the subject for a group including the speaker.'),
(12, 'sentence_completion', 'easy', 'Can ___ start now?', 'en', 'we', 'subject', 'Can ___ start now?', 'Can we start now?', 1, 'Use "we" as the subject in a question.'),
(12, 'sentence_completion', 'easy', '___ love our family.', 'en', 'We', 'subject', '___ love our family.', 'We love our family.', 0, 'Use "We" as the subject pronoun.'),
(12, 'sentence_completion', 'easy', '___ have two cats.', 'en', 'We', 'subject', '___ have two cats.', 'We have two cats.', 0, 'Use "We" to show possession as a group.'),
(12, 'sentence_completion', 'easy', '___ are students.', 'en', 'We', 'subject', '___ are students.', 'We are students.', 0, 'Use "We" to identify the group.'),
(12, 'sentence_completion', 'easy', '___ want some pizza.', 'en', 'We', 'subject', '___ want some pizza.', 'We want some pizza.', 0, 'Use "We" to express a group desire.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(89, 'أنا'), (89, 'هو'), (89, 'هي'), (89, 'هم'), (89, 'أنت'), (89, 'هذا'), (89, 'ذلك'), (89, 'من'), (89, 'إلى'), (89, 'في'),
(90, 'I'), (90, 'he'), (90, 'she'), (90, 'it'), (90, 'they'), (90, 'you'), (90, 'us'), (90, 'our'), (90, 'ours'), (90, 'ourselves'),
(91, 'I'), (91, 'He'), (91, 'She'), (91, 'It'), (91, 'They'), (91, 'You'), (91, 'Us'), (91, 'Our'), (91, 'Ours'), (91, 'Ourselves'),
(92, 'I'), (92, 'he'), (92, 'she'), (92, 'it'), (92, 'they'), (92, 'you'), (92, 'us'), (92, 'our'), (92, 'ours'), (92, 'ourselves'),
(93, 'I'), (93, 'He'), (93, 'She'), (93, 'It'), (93, 'They'), (93, 'You'), (93, 'Us'), (93, 'Our'), (93, 'Ours'), (93, 'Ourselves'),
(94, 'I'), (94, 'He'), (94, 'She'), (94, 'It'), (94, 'They'), (94, 'You'), (94, 'Us'), (94, 'Our'), (94, 'Ours'), (94, 'Ourselves'),
(95, 'I'), (95, 'He'), (95, 'She'), (95, 'It'), (95, 'They'), (95, 'You'), (95, 'Us'), (95, 'Our'), (95, 'Ours'), (95, 'Ourselves'),
(96, 'I'), (96, 'He'), (96, 'She'), (96, 'It'), (96, 'They'), (96, 'You'), (96, 'Us'), (96, 'Our'), (96, 'Ours'), (96, 'Ourselves');

-- =============================================================================
-- WORD 13: they (ID: 13, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (13, 'they', 'هم', 'pron.', 'Used to refer to two or more people or things previously mentioned or easily identified.', 'يستخدم للإشارة إلى شخصين أو أكثر أو أشياء ذكرت سابقاً.', 'هم', '["هن"]', '{"subject": "they", "object": "them", "possessive": "their", "possessive_pronoun": "theirs", "reflexive": "themselves"}', '/ðeɪ/', 'they.mp3', '{"synonyms": [], "antonyms": [], "word_family": ["them", "their", "theirs", "themselves"]}', 'The third-person plural subject pronoun.', 'Beginner', 25);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(13, '{They} are students.', 'هم طلاب.', 'they', 'Identity', 'Easy', 1, 1),
(13, '{They} live in London.', 'هم يعيشون في لندن.', 'they', 'Location', 'Easy', 0, 2),
(13, '{They} like to play football.', 'هم يحبون لعب كرة القدم.', 'they', 'Hobbies', 'Easy', 0, 3),
(13, '{They} are very kind people.', 'هم أناس طيبون جداً.', 'they', 'Personality', 'Easy', 0, 4),
(13, '{They} saw the movie yesterday.', 'شاهدوا الفيلم أمس.', 'they', 'Entertainment', 'Easy', 0, 5),
(13, '{They} have a big house.', 'لديهم منزل كبير.', 'they', 'Possession', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(13, 'translation_match', 'easy', 'they', 'en', 'هم', 'subject', NULL, NULL, NULL, '"they" is the third-person plural subject pronoun.'),
(13, 'reverse_translation', 'easy', 'هم', 'ar', 'they', 'subject', NULL, NULL, NULL, 'The Arabic "هم" translates to "they" in English.'),
(13, 'sentence_completion', 'easy', '___ are my friends.', 'en', 'They', 'subject', '___ are my friends.', 'They are my friends.', 0, 'Use "They" as the subject for a group of people.'),
(13, 'sentence_completion', 'easy', 'Where do ___ work?', 'en', 'they', 'subject', 'Where do ___ work?', 'Where do they work?', 2, 'Use "they" as the subject in a question.'),
(13, 'sentence_completion', 'easy', '___ have a new car.', 'en', 'They', 'subject', '___ have a new car.', 'They have a new car.', 0, 'Use "They" to show possession by a group.'),
(13, 'sentence_completion', 'easy', '___ are very busy today.', 'en', 'They', 'subject', '___ are very busy today.', 'They are very busy today.', 0, 'Use "They" as the subject pronoun.'),
(13, 'sentence_completion', 'easy', '___ speak Spanish well.', 'en', 'They', 'subject', '___ speak Spanish well.', 'They speak Spanish well.', 0, 'Use "They" to describe a group''s ability.'),
(13, 'sentence_completion', 'easy', 'Are ___ coming to the party?', 'en', 'they', 'subject', 'Are ___ coming to the party?', 'Are they coming to the party?', 1, 'Use "they" as the subject after the verb "be" in a question.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(97, 'أنا'), (97, 'هو'), (97, 'هي'), (97, 'نحن'), (97, 'أنت'), (97, 'هذا'), (97, 'ذلك'), (97, 'من'), (97, 'إلى'), (97, 'في'),
(98, 'I'), (98, 'he'), (98, 'she'), (98, 'it'), (98, 'we'), (98, 'you'), (98, 'them'), (98, 'their'), (98, 'theirs'), (98, 'themselves'),
(99, 'I'), (99, 'He'), (99, 'She'), (99, 'It'), (99, 'We'), (99, 'You'), (99, 'Them'), (99, 'Their'), (99, 'Theirs'), (99, 'Themselves'),
(100, 'I'), (100, 'he'), (100, 'she'), (100, 'it'), (100, 'we'), (100, 'you'), (100, 'them'), (100, 'their'), (100, 'theirs'), (100, 'themselves'),
(101, 'I'), (101, 'He'), (101, 'She'), (101, 'It'), (101, 'We'), (101, 'You'), (101, 'Them'), (101, 'Their'), (101, 'Theirs'), (101, 'Themselves'),
(102, 'I'), (102, 'He'), (102, 'She'), (102, 'It'), (102, 'We'), (102, 'You'), (102, 'Them'), (102, 'Their'), (102, 'Theirs'), (102, 'Themselves'),
(103, 'I'), (103, 'He'), (103, 'She'), (103, 'It'), (103, 'We'), (103, 'You'), (103, 'Them'), (103, 'Their'), (103, 'Theirs'), (103, 'Themselves'),
(104, 'I'), (104, 'He'), (104, 'She'), (104, 'It'), (104, 'We'), (104, 'You'), (104, 'Them'), (104, 'Their'), (104, 'Theirs'), (104, 'Themselves');

-- =============================================================================
-- WORD 14: say (ID: 14, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (14, 'say', 'يقول', 'v.', 'To utter words so as to convey information, an opinion, or a feeling.', 'نطق الكلمات لنقل معلومات أو رأي أو شعور.', 'يقول', '["يصرح", "يذكر"]', '{"base": "say", "thirdPerson": "says", "past": "said", "participle": "said", "gerund": "saying"}', '/seɪ/', 'say.mp3', '{"synonyms": ["tell", "speak", "utter"], "antonyms": ["be silent"], "word_family": ["saying"]}', 'Used for direct and indirect speech.', 'Beginner', 26);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(14, 'What did you {say}?', 'ماذا قلت؟', 'say', 'Communication', 'Easy', 1, 1),
(14, 'He {says} that he is busy.', 'يقول إنه مشغول.', 'says', 'Communication', 'Easy', 0, 2),
(14, 'She {said} goodbye to everyone.', 'قالت وداعاً للجميع.', 'said', 'Social', 'Easy', 0, 3),
(14, 'I am {saying} the truth.', 'أنا أقول الحقيقة.', 'saying', 'General', 'Easy', 0, 4),
(14, 'It is hard to {say} no.', 'من الصعب قول لا.', 'say', 'Emotion', 'Easy', 0, 5),
(14, 'They {say} it will rain today.', 'يقولون إنها ستمطر اليوم.', 'say', 'Weather', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(14, 'translation_match', 'easy', 'say', 'en', 'يقول', 'base', NULL, NULL, NULL, '"say" is the base verb for expressing words.'),
(14, 'reverse_translation', 'easy', 'يقول', 'ar', 'say', 'base', NULL, NULL, NULL, 'The Arabic verb "يقول" translates to "say".'),
(14, 'sentence_completion', 'easy', 'Please ___ hello to your father.', 'en', 'say', 'base', 'Please ___ hello to your father.', 'Please say hello to your father.', 1, 'Use the base form "say" for imperatives.'),
(14, 'sentence_completion', 'easy', 'He always ___ "please".', 'en', 'says', 'thirdPerson', 'He always ___ "please".', 'He always says "please".', 2, 'Use "says" for third-person singular present.'),
(14, 'sentence_completion', 'easy', 'Yesterday, she ___ she was tired.', 'en', 'said', 'past', 'Yesterday, she ___ she was tired.', 'Yesterday, she said she was tired.', 3, 'Use "said" for the past tense.'),
(14, 'sentence_completion', 'easy', 'What are you ___?', 'en', 'saying', 'gerund', 'What are you ___?', 'What are you saying?', 3, 'Use "saying" for the present continuous.'),
(14, 'sentence_completion', 'easy', 'I have already ___ everything.', 'en', 'said', 'participle', 'I have already ___ everything.', 'I have already said everything.', 3, 'Use "said" as the past participle.'),
(14, 'sentence_completion', 'easy', 'They ___ that the movie is good.', 'en', 'say', 'base', 'They ___ that the movie is good.', 'They say that the movie is good.', 1, 'Use "say" for plural subjects.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(105, 'يسمع'), (105, 'يرى'), (105, 'يمشي'), (105, 'يأكل'), (105, 'يشرب'), (105, 'ينام'), (105, 'يذهب'), (105, 'يأتي'), (105, 'يفعل'), (105, 'يأخذ'),
(106, 'tell'), (106, 'speak'), (106, 'talk'), (106, 'hear'), (106, 'see'), (106, 'walk'), (106, 'eat'), (106, 'drink'), (106, 'sleep'), (106, 'go'),
(107, 'says'), (107, 'said'), (107, 'saying'), (107, 'tells'), (107, 'told'), (107, 'speaks'), (107, 'spoke'), (107, 'talks'), (107, 'talked'), (107, 'hearing'),
(108, 'say'), (108, 'said'), (108, 'saying'), (108, 'tell'), (108, 'tells'), (108, 'told'), (108, 'speak'), (108, 'speaks'), (108, 'talk'), (108, 'talks'),
(109, 'say'), (109, 'says'), (109, 'saying'), (109, 'tell'), (109, 'tells'), (109, 'told'), (109, 'speak'), (109, 'speaks'), (109, 'talk'), (109, 'talked'),
(110, 'say'), (110, 'says'), (110, 'said'), (110, 'tell'), (110, 'telling'), (110, 'told'), (110, 'speak'), (110, 'speaking'), (110, 'talk'), (110, 'talking'),
(111, 'say'), (111, 'says'), (111, 'saying'), (111, 'tell'), (111, 'tells'), (111, 'told'), (111, 'speak'), (111, 'speaks'), (111, 'talk'), (111, 'talks'),
(112, 'says'), (112, 'said'), (112, 'saying'), (112, 'tell'), (112, 'tells'), (112, 'told'), (112, 'speak'), (112, 'speaks'), (112, 'talk'), (112, 'talks');

-- =============================================================================
-- WORD 15: at (ID: 15, POS: prep.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (15, 'at', 'في / عند', 'prep.', 'Used to express location or arrival in a particular place or position.', 'يستخدم للتعبير عن الموقع أو الوصول إلى مكان أو وضع معين.', 'في / عند', '["على", "في تمام الساعة"]', '{"base": "at"}', '/æt/', 'at.mp3', '{"synonyms": ["in", "on"], "antonyms": [], "word_family": []}', 'Used for specific points in space, specific times, and activities.', 'Beginner', 27);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(15, 'I am {at} school.', 'أنا في المدرسة.', 'at', 'Location', 'Easy', 1, 1),
(15, 'See you {at} 5 PM.', 'أراك في تمام الساعة الخامسة مساءً.', 'at', 'Time', 'Easy', 0, 2),
(15, 'Look {at} me.', 'انظر إلي.', 'at', 'Direction', 'Easy', 0, 3),
(15, 'He is {at} the door.', 'هو عند الباب.', 'at', 'Location', 'Easy', 0, 4),
(15, 'She is good {at} math.', 'هي جيدة في الرياضيات.', 'at', 'Skills', 'Easy', 0, 5),
(15, 'We are {at} the park.', 'نحن في الحديقة.', 'at', 'Location', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(15, 'translation_match', 'easy', 'at', 'en', 'في / عند', 'base', NULL, NULL, NULL, '"at" is used for specific locations or times.'),
(15, 'reverse_translation', 'easy', 'عند', 'ar', 'at', 'base', NULL, NULL, NULL, 'The Arabic "عند" often translates to "at" in English.'),
(15, 'sentence_completion', 'easy', 'I will meet you ___ the station.', 'en', 'at', 'base', 'I will meet you ___ the station.', 'I will meet you at the station.', 4, 'Use "at" for a specific point or location.'),
(15, 'sentence_completion', 'easy', 'The movie starts ___ 8 o''clock.', 'en', 'at', 'base', 'The movie starts ___ 8 o''clock.', 'The movie starts at 8 o''clock.', 3, 'Use "at" before specific clock times.'),
(15, 'sentence_completion', 'easy', 'Stop looking ___ him.', 'en', 'at', 'base', 'Stop looking ___ him.', 'Stop looking at him.', 2, 'The verb "look" is followed by "at" when directed at someone.'),
(15, 'sentence_completion', 'easy', 'He is ___ home right now.', 'en', 'at', 'base', 'He is ___ home right now.', 'He is at home right now.', 2, 'Use "at" with "home" to show location.'),
(15, 'sentence_completion', 'easy', 'I am bad ___ drawing.', 'en', 'at', 'base', 'I am bad ___ drawing.', 'I am bad at drawing.', 2, 'Use "at" after adjectives like "good" or "bad" to show skill.'),
(15, 'sentence_completion', 'easy', 'We arrived ___ the airport early.', 'en', 'at', 'base', 'We arrived ___ the airport early.', 'We arrived at the airport early.', 2, 'Use "at" for arrival at a specific destination.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(113, 'من'), (113, 'إلى'), (113, 'مع'), (113, 'على'), (113, 'عن'), (113, 'بـ'), (113, 'لـ'), (113, 'تحت'), (113, 'فوق'), (113, 'بين'),
(114, 'from'), (114, 'to'), (114, 'with'), (114, 'on'), (114, 'about'), (114, 'by'), (114, 'for'), (114, 'under'), (114, 'over'), (114, 'in'),
(115, 'in'), (115, 'on'), (115, 'to'), (115, 'from'), (115, 'with'), (115, 'by'), (115, 'for'), (115, 'about'), (115, 'under'), (115, 'over'),
(116, 'in'), (116, 'on'), (116, 'to'), (116, 'from'), (116, 'with'), (116, 'by'), (116, 'for'), (116, 'about'), (116, 'under'), (116, 'over'),
(117, 'in'), (117, 'on'), (117, 'to'), (117, 'from'), (117, 'with'), (117, 'by'), (117, 'for'), (117, 'about'), (117, 'under'), (116, 'over'),
(118, 'in'), (118, 'on'), (118, 'to'), (118, 'from'), (118, 'with'), (118, 'by'), (118, 'for'), (118, 'about'), (118, 'under'), (118, 'over'),
(119, 'in'), (119, 'on'), (119, 'to'), (119, 'from'), (119, 'with'), (119, 'by'), (119, 'for'), (119, 'about'), (119, 'under'), (119, 'over'),
(120, 'in'), (120, 'on'), (120, 'to'), (120, 'from'), (120, 'with'), (120, 'by'), (120, 'for'), (120, 'about'), (120, 'under'), (120, 'over');

-- =============================================================================
-- WORD 16: what (ID: 16, POS: pron./det.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (16, 'what', 'ماذا / ما', 'pron./det.', 'Asking for information specifying something.', 'طلب معلومات تحدد شيئاً ما.', 'ماذا / ما', '["الذي"]', '{"base": "what"}', '/wɒt/', 'what.mp3', '{"synonyms": ["which"], "antonyms": [], "word_family": ["whatever"]}', 'Used to ask questions or as a relative pronoun.', 'Beginner', 28);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(16, '{What} is your name?', 'ما اسمك؟', 'what', 'Identity', 'Easy', 1, 1),
(16, '{What} time is it?', 'كم الساعة؟', 'what', 'Time', 'Easy', 0, 2),
(16, '{What} are you doing?', 'ماذا تفعل؟', 'what', 'Activity', 'Easy', 0, 3),
(16, 'I know {what} you mean.', 'أعرف ما تقصده.', 'what', 'General', 'Easy', 0, 4),
(16, '{What} happened yesterday?', 'ماذا حدث أمس؟', 'what', 'Past Events', 'Easy', 0, 5),
(16, '{What} kind of music do you like?', 'أي نوع من الموسيقى تحب؟', 'what', 'Preferences', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(16, 'translation_match', 'easy', 'what', 'en', 'ماذا / ما', 'base', NULL, NULL, NULL, '"what" is used to ask for information about things.'),
(16, 'reverse_translation', 'easy', 'ماذا / ما', 'ar', 'what', 'base', NULL, NULL, NULL, 'The Arabic "ماذا" or "ما" translates to "what" in English.'),
(16, 'sentence_completion', 'easy', '___ is your favorite color?', 'en', 'What', 'base', '___ is your favorite color?', 'What is your favorite color?', 0, 'Use "What" to ask for specific information.'),
(16, 'sentence_completion', 'easy', '___ time do you wake up?', 'en', 'What', 'base', '___ time do you wake up?', 'What time do you wake up?', 0, 'Use "What" with "time" to ask about the clock.'),
(16, 'sentence_completion', 'easy', '___ did he say?', 'en', 'What', 'base', '___ did he say?', 'What did he say?', 0, 'Use "What" to ask about spoken information.'),
(16, 'sentence_completion', 'easy', 'Tell me ___ you want.', 'en', 'what', 'base', 'Tell me ___ you want.', 'Tell me what you want.', 2, 'Use "what" to refer to a thing or choice.'),
(16, 'sentence_completion', 'easy', '___ a beautiful day!', 'en', 'What', 'base', '___ a beautiful day!', 'What a beautiful day!', 0, 'Use "What" in exclamations to show emphasis.'),
(16, 'sentence_completion', 'easy', '___ is the matter?', 'en', 'What', 'base', '___ is the matter?', 'What is the matter?', 0, 'Use "What" to ask about a problem.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(121, 'من'), (121, 'متى'), (121, 'أين'), (121, 'لماذا'), (121, 'كيف'), (121, 'أي'), (121, 'كم'), (121, 'هل'), (121, 'الذي'), (121, 'هذا'),
(122, 'who'), (122, 'when'), (122, 'where'), (122, 'why'), (122, 'how'), (122, 'which'), (122, 'how many'), (122, 'that'), (122, 'this'), (122, 'it'),
(123, 'Who'), (123, 'When'), (123, 'Where'), (123, 'Why'), (123, 'How'), (123, 'Which'), (123, 'That'), (123, 'This'), (123, 'It'), (123, 'Whose'),
(124, 'Who'), (124, 'When'), (124, 'Where'), (124, 'Why'), (124, 'How'), (124, 'Which'), (124, 'That'), (124, 'This'), (124, 'It'), (124, 'Whose'),
(125, 'Who'), (125, 'When'), (125, 'Where'), (125, 'Why'), (125, 'How'), (125, 'Which'), (125, 'That'), (125, 'This'), (125, 'It'), (125, 'Whose'),
(126, 'who'), (126, 'when'), (126, 'where'), (126, 'why'), (126, 'how'), (126, 'which'), (126, 'that'), (126, 'this'), (126, 'it'), (126, 'whose'),
(127, 'Who'), (127, 'When'), (127, 'Where'), (127, 'Why'), (127, 'How'), (127, 'Which'), (127, 'That'), (127, 'This'), (127, 'It'), (127, 'Whose'),
(128, 'Who'), (128, 'When'), (128, 'Where'), (128, 'Why'), (128, 'How'), (128, 'Which'), (128, 'That'), (128, 'This'), (128, 'It'), (128, 'Whose');

-- =============================================================================
-- WORD 17: from (ID: 17, POS: prep.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (17, 'from', 'من', 'prep.', 'Used to indicate the point in space or time at which a journey, motion, or action starts.', 'يستخدم للإشارة إلى نقطة في المكان أو الزمان التي تبدأ عندها رحلة أو حركة أو فعل.', 'من', '["عن", "بسبب"]', '{"base": "from"}', '/frɒm/', 'from.mp3', '{"synonyms": ["starting at"], "antonyms": ["to"], "word_family": []}', 'Indicates origin, source, or starting point.', 'Beginner', 30);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(17, 'I am {from} Egypt.', 'أنا من مصر.', 'from', 'Origin', 'Easy', 1, 1),
(17, 'The train goes {from} London to Paris.', 'القطار يذهب من لندن إلى باريس.', 'from', 'Travel', 'Easy', 0, 2),
(17, 'I work {from} nine to five.', 'أعمل من التاسعة إلى الخامسة.', 'from', 'Time', 'Easy', 0, 3),
(17, 'This gift is {from} my brother.', 'هذه الهدية من أخي.', 'from', 'Social', 'Easy', 0, 4),
(17, 'Bread is made {from} flour.', 'الخبز يصنع من الدقيق.', 'from', 'Food', 'Easy', 0, 5),
(17, 'He is different {from} his twin.', 'هو مختلف عن توأمه.', 'from', 'Comparison', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(17, 'translation_match', 'easy', 'from', 'en', 'من', 'base', NULL, NULL, NULL, '"from" is the primary preposition for origin or starting point.'),
(17, 'reverse_translation', 'easy', 'من', 'ar', 'from', 'base', NULL, NULL, NULL, 'The Arabic "من" translates to "from" in English.'),
(17, 'sentence_completion', 'easy', 'Where are you ___?', 'en', 'from', 'base', 'Where are you ___?', 'Where are you from?', 3, 'Use "from" to ask about someone''s origin.'),
(17, 'sentence_completion', 'easy', 'I am ___ Morocco.', 'en', 'from', 'base', 'I am ___ Morocco.', 'I am from Morocco.', 2, 'Use "from" to state your country of origin.'),
(17, 'sentence_completion', 'easy', 'The store is open ___ 8 AM.', 'en', 'from', 'base', 'The store is open ___ 8 AM.', 'The store is open from 8 AM.', 4, 'Use "from" to show the starting time.'),
(17, 'sentence_completion', 'easy', 'He took a book ___ the shelf.', 'en', 'from', 'base', 'He took a book ___ the shelf.', 'He took a book from the shelf.', 4, 'Use "from" to show the source of an action.'),
(17, 'sentence_completion', 'easy', 'It is far ___ here.', 'en', 'from', 'base', 'It is far ___ here.', 'It is far from here.', 3, 'Use "from" to indicate distance from a point.'),
(17, 'sentence_completion', 'easy', 'I received a letter ___ her.', 'en', 'from', 'base', 'I received a letter ___ her.', 'I received a letter from her.', 4, 'Use "from" to indicate the sender.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(129, 'إلى'), (129, 'في'), (129, 'على'), (129, 'مع'), (129, 'عن'), (129, 'بـ'), (129, 'لـ'), (129, 'تحت'), (129, 'فوق'), (129, 'بين'),
(130, 'to'), (130, 'in'), (130, 'on'), (130, 'with'), (130, 'about'), (130, 'by'), (130, 'for'), (130, 'under'), (130, 'over'), (130, 'at'),
(131, 'to'), (131, 'in'), (131, 'on'), (131, 'with'), (131, 'about'), (131, 'by'), (131, 'for'), (131, 'at'), (131, 'of'), (131, 'since'),
(132, 'to'), (132, 'in'), (132, 'on'), (132, 'with'), (132, 'about'), (132, 'by'), (132, 'for'), (132, 'at'), (132, 'of'), (132, 'since'),
(133, 'to'), (133, 'in'), (133, 'on'), (133, 'with'), (133, 'about'), (133, 'by'), (133, 'for'), (133, 'at'), (133, 'of'), (133, 'since'),
(134, 'to'), (134, 'in'), (134, 'on'), (134, 'with'), (134, 'about'), (134, 'by'), (134, 'for'), (134, 'at'), (134, 'of'), (134, 'since'),
(135, 'to'), (135, 'in'), (135, 'on'), (135, 'with'), (135, 'about'), (135, 'by'), (135, 'for'), (135, 'at'), (135, 'of'), (135, 'since'),
(136, 'to'), (136, 'in'), (136, 'on'), (136, 'with'), (136, 'about'), (136, 'by'), (136, 'for'), (136, 'at'), (136, 'of'), (136, 'since');

-- =============================================================================
-- WORD 18: go (ID: 18, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (18, 'go', 'يذهب', 'v.', 'To move from one place to another.', 'الانتقال من مكان إلى آخر.', 'يذهب', '["يسير", "ينطلق"]', '{"base": "go", "thirdPerson": "goes", "past": "went", "participle": "gone", "gerund": "going"}', '/ɡəʊ/', 'go.mp3', '{"synonyms": ["move", "travel"], "antonyms": ["stay", "come"], "word_family": ["going", "gone"]}', 'One of the most common verbs of movement.', 'Beginner', 31);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(18, 'I {go} to school every day.', 'أنا أذهب إلى المدرسة كل يوم.', 'go', 'Routine', 'Easy', 1, 1),
(18, 'She {goes} to work by bus.', 'هي تذهب إلى العمل بالحافلة.', 'goes', 'Travel', 'Easy', 0, 2),
(18, 'We {went} to the park yesterday.', 'ذهبنا إلى الحديقة أمس.', 'went', 'Past Events', 'Easy', 0, 3),
(18, 'They have {gone} to London.', 'لقد ذهبوا إلى لندن.', 'gone', 'Travel', 'Easy', 0, 4),
(18, 'I am {going} home now.', 'أنا ذاهب إلى المنزل الآن.', 'going', 'Current Action', 'Easy', 0, 5),
(18, 'Let''s {go} to the cinema.', 'لنذهب إلى السينما.', 'go', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(18, 'translation_match', 'easy', 'go', 'en', 'يذهب', 'base', NULL, NULL, NULL, '"go" is the base verb for moving to a place.'),
(18, 'reverse_translation', 'easy', 'يذهب', 'ar', 'go', 'base', NULL, NULL, NULL, 'The Arabic verb "يذهب" translates to "go".'),
(18, 'sentence_completion', 'easy', 'I ___ to the gym.', 'en', 'go', 'base', 'I ___ to the gym.', 'I go to the gym.', 1, 'Use the base form "go" with the pronoun "I".'),
(18, 'sentence_completion', 'easy', 'He ___ to the office.', 'en', 'goes', 'thirdPerson', 'He ___ to the office.', 'He goes to the office.', 1, 'Use "goes" for third-person singular present.'),
(18, 'sentence_completion', 'easy', 'They ___ to the beach last week.', 'en', 'went', 'past', 'They ___ to the beach last week.', 'They went to the beach last week.', 1, 'Use "went" for the past tense of "go".'),
(18, 'sentence_completion', 'easy', 'She is ___ to the store.', 'en', 'going', 'gerund', 'She is ___ to the store.', 'She is going to the store.', 2, 'Use "going" for the present continuous.'),
(18, 'sentence_completion', 'easy', 'He has ___ to the bank.', 'en', 'gone', 'participle', 'He has ___ to the bank.', 'He has gone to the bank.', 2, 'Use "gone" as the past participle.'),
(18, 'sentence_completion', 'easy', 'Please ___ to the door.', 'en', 'go', 'base', 'Please ___ to the door.', 'Please go to the door.', 1, 'Use the base form for imperatives.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(137, 'يأكل'), (137, 'ينام'), (137, 'يرى'), (137, 'يأخذ'), (137, 'يعطي'), (137, 'يأتي'), (137, 'يصنع'), (137, 'يقول'), (137, 'يحصل'), (137, 'يكون'),
(138, 'eat'), (138, 'sleep'), (138, 'see'), (138, 'take'), (138, 'give'), (138, 'come'), (138, 'make'), (138, 'say'), (138, 'get'), (138, 'be'),
(139, 'goes'), (139, 'went'), (139, 'gone'), (139, 'going'), (139, 'eats'), (139, 'sees'), (139, 'takes'), (139, 'gives'), (139, 'comes'), (139, 'makes'),
(140, 'go'), (140, 'went'), (140, 'gone'), (140, 'going'), (140, 'eat'), (140, 'see'), (140, 'take'), (140, 'give'), (140, 'come'), (140, 'make'),
(141, 'go'), (141, 'goes'), (141, 'gone'), (141, 'going'), (141, 'eat'), (141, 'see'), (141, 'take'), (141, 'give'), (141, 'come'), (141, 'make'),
(142, 'go'), (142, 'goes'), (142, 'went'), (142, 'gone'), (142, 'eat'), (142, 'see'), (142, 'take'), (142, 'give'), (142, 'come'), (142, 'make'),
(143, 'go'), (143, 'goes'), (143, 'went'), (143, 'going'), (143, 'eat'), (143, 'see'), (143, 'take'), (143, 'give'), (143, 'come'), (143, 'make'),
(144, 'goes'), (144, 'went'), (144, 'gone'), (144, 'going'), (144, 'eat'), (144, 'see'), (144, 'take'), (144, 'give'), (144, 'come'), (144, 'make');

-- =============================================================================
-- WORD 19: or (ID: 19, POS: conj.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (19, 'or', 'أو', 'conj.', 'Used to link alternatives.', 'تستخدم للربط بين البدائل.', 'أو', '["أم"]', '{"base": "or"}', '/ɔːr/', 'or.mp3', '{"synonyms": ["alternatively"], "antonyms": [], "word_family": []}', 'Used in questions and negative statements to offer choices.', 'Beginner', 32);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(19, 'Tea {or} coffee?', 'شاي أم قهوة؟', 'or', 'Food', 'Easy', 1, 1),
(19, 'Is it true {or} false?', 'هل هو صح أم خطأ؟', 'or', 'General', 'Easy', 0, 2),
(19, 'Now {or} later?', 'الآن أم لاحقاً؟', 'or', 'Time', 'Easy', 0, 3),
(19, 'Red {or} blue?', 'أحمر أم أزرق؟', 'or', 'Colors', 'Easy', 0, 4),
(19, 'Him {or} her?', 'هو أم هي؟', 'or', 'Social', 'Easy', 0, 5),
(19, 'Left {or} right?', 'يسار أم يمين؟', 'or', 'Direction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(19, 'translation_match', 'easy', 'or', 'en', 'أو', 'base', NULL, NULL, NULL, '"or" is used to present a choice between two things.'),
(19, 'reverse_translation', 'easy', 'أو', 'ar', 'or', 'base', NULL, NULL, NULL, 'The Arabic "أو" translates to "or" in English.'),
(19, 'sentence_completion', 'easy', 'Do you want milk ___ sugar?', 'en', 'or', 'base', 'Do you want milk ___ sugar?', 'Do you want milk or sugar?', 4, 'Use "or" to offer a choice.'),
(19, 'sentence_completion', 'easy', 'Is he a doctor ___ a nurse?', 'en', 'or', 'base', 'Is he a doctor ___ a nurse?', 'Is he a doctor or a nurse?', 4, 'Use "or" to ask about alternatives.'),
(19, 'sentence_completion', 'easy', 'Yes ___ no?', 'en', 'or', 'base', 'Yes ___ no?', 'Yes or no?', 1, 'Common binary choice using "or".'),
(19, 'sentence_completion', 'easy', 'Stop ___ I will call the police.', 'en', 'or', 'base', 'Stop ___ I will call the police.', 'Stop or I will call the police.', 1, 'Use "or" to show a consequence of not doing something.'),
(19, 'sentence_completion', 'easy', 'Is it Monday ___ Tuesday?', 'en', 'or', 'base', 'Is it Monday ___ Tuesday?', 'Is it Monday or Tuesday?', 3, 'Use "or" for choices between days.'),
(19, 'sentence_completion', 'easy', 'Eat it now ___ it will get cold.', 'en', 'or', 'base', 'Eat it now ___ it will get cold.', 'Eat it now or it will get cold.', 3, 'Use "or" to link a condition and a result.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(145, 'و'), (145, 'لكن'), (145, 'إذا'), (145, 'من'), (145, 'إلى'), (145, 'في'), (145, 'على'), (145, 'عن'), (145, 'مع'), (145, 'بـ'),
(146, 'and'), (146, 'but'), (146, 'if'), (146, 'so'), (146, 'yet'), (146, 'for'), (146, 'nor'), (146, 'with'), (146, 'to'), (146, 'of'),
(147, 'and'), (147, 'but'), (147, 'if'), (147, 'so'), (147, 'yet'), (147, 'for'), (147, 'nor'), (147, 'with'), (147, 'to'), (147, 'of'),
(148, 'and'), (148, 'but'), (148, 'if'), (148, 'so'), (148, 'yet'), (148, 'for'), (148, 'nor'), (148, 'with'), (148, 'to'), (148, 'of'),
(149, 'and'), (149, 'but'), (149, 'if'), (149, 'so'), (149, 'yet'), (149, 'for'), (149, 'nor'), (149, 'with'), (149, 'to'), (149, 'of'),
(150, 'and'), (150, 'but'), (150, 'if'), (150, 'so'), (150, 'yet'), (150, 'for'), (150, 'nor'), (150, 'with'), (150, 'to'), (150, 'of'),
(151, 'and'), (151, 'but'), (151, 'if'), (151, 'so'), (151, 'yet'), (151, 'for'), (151, 'nor'), (151, 'with'), (151, 'to'), (151, 'of'),
(152, 'and'), (152, 'but'), (152, 'if'), (152, 'so'), (152, 'yet'), (152, 'for'), (152, 'nor'), (152, 'with'), (152, 'to'), (152, 'of');

-- =============================================================================
-- WORD 20: get (ID: 20, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (20, 'get', 'يحصل على', 'v.', 'To receive, obtain, or reach a state.', 'أن يتلقى، يحصل على، أو يصل إلى حالة معينة.', 'يحصل على', '["ينال", "يصل", "يصبح"]', '{"base": "get", "thirdPerson": "gets", "past": "got", "participle": "gotten", "gerund": "getting"}', '/ɡɛt/', 'get.mp3', '{"synonyms": ["obtain", "receive", "become"], "antonyms": ["give", "lose"], "word_family": ["getter"]}', 'A very versatile verb used in many phrasal verbs.', 'Beginner', 34);

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
(20, 'sentence_completion', 'easy', 'I have ___ a gift for you.', 'en', 'gotten', 'participle', 'I have ___ a gift for you.', 'I have gotten a gift for you.', 2, 'Use "gotten" as the past participle (US English).'),
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
-- WORD 21: she (ID: 21, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (21, 'she', 'هي', 'pron.', 'Used to refer to a woman, girl, or female animal previously mentioned.', 'تستخدم للإشارة إلى امرأة أو فتاة أو حيوان أنثى ذكر سابقاً.', 'هي', '[]', '{"subject": "she", "object": "her", "possessive": "her", "possessive_pronoun": "hers", "reflexive": "herself"}', '/ʃiː/', 'she.mp3', '{"synonyms": [], "antonyms": ["he"], "word_family": []}', 'The third-person singular feminine subject pronoun.', 'Beginner', 35);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(21, '{She} is a doctor.', 'هي طبيبة.', 'she', 'Jobs', 'Easy', 1, 1),
(21, '{She} likes to read.', 'هي تحب القراءة.', 'she', 'Hobbies', 'Easy', 0, 2),
(21, 'Is {she} coming to the party?', 'هل هي قادمة إلى الحفلة؟', 'she', 'Social', 'Easy', 0, 3),
(21, '{She} has a beautiful voice.', 'لها صوت جميل.', 'she', 'Description', 'Easy', 0, 4),
(21, '{She} lives in London.', 'هي تعيش في لندن.', 'she', 'Location', 'Easy', 0, 5),
(21, '{She} is my sister.', 'هي أختي.', 'she', 'Family', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(21, 'translation_match', 'easy', 'she', 'en', 'هي', 'subject', NULL, NULL, NULL, '"she" is the feminine subject pronoun.'),
(21, 'reverse_translation', 'easy', 'هي', 'ar', 'she', 'subject', NULL, NULL, NULL, 'The Arabic "هي" translates to "she" in English.'),
(21, 'sentence_completion', 'easy', '___ is a teacher.', 'en', 'She', 'subject', '___ is a teacher.', 'She is a teacher.', 0, 'Use "She" as the subject for a female person.'),
(21, 'sentence_completion', 'easy', 'Does ___ speak Arabic?', 'en', 'she', 'subject', 'Does ___ speak Arabic?', 'Does she speak Arabic?', 1, 'Use "she" as the subject in a question.'),
(21, 'sentence_completion', 'easy', '___ works at the bank.', 'en', 'She', 'subject', '___ works at the bank.', 'She works at the bank.', 0, 'Use "She" as the subject pronoun.'),
(21, 'sentence_completion', 'easy', '___ is very kind.', 'en', 'She', 'subject', '___ is very kind.', 'She is very kind.', 0, 'Use "She" to describe a female person.'),
(21, 'sentence_completion', 'easy', 'Where does ___ live?', 'en', 'she', 'subject', 'Where does ___ live?', 'Where does she live?', 2, 'Use "she" as the subject pronoun.'),
(21, 'sentence_completion', 'easy', '___ is my best friend.', 'en', 'She', 'subject', '___ is my best friend.', 'She is my best friend.', 0, 'Use "She" to refer to a female friend.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(161, 'هو'), (161, 'أنا'), (161, 'نحن'), (161, 'هم'), (161, 'أنت'), (161, 'هذا'), (161, 'ذلك'), (161, 'من'), (161, 'إلى'), (161, 'في'),
(162, 'he'), (162, 'I'), (162, 'we'), (162, 'they'), (162, 'you'), (162, 'it'), (162, 'her'), (162, 'his'), (162, 'him'), (162, 'them'),
(163, 'He'), (163, 'I'), (163, 'We'), (163, 'They'), (163, 'You'), (163, 'It'), (163, 'Her'), (163, 'His'), (163, 'Him'), (163, 'Them'),
(164, 'he'), (164, 'I'), (164, 'we'), (164, 'they'), (164, 'you'), (164, 'it'), (164, 'her'), (164, 'his'), (164, 'him'), (164, 'them'),
(165, 'He'), (165, 'I'), (165, 'We'), (165, 'They'), (165, 'You'), (165, 'It'), (165, 'Her'), (165, 'His'), (165, 'Him'), (165, 'Them'),
(166, 'He'), (166, 'I'), (166, 'We'), (166, 'They'), (166, 'You'), (166, 'It'), (166, 'Her'), (166, 'His'), (166, 'Him'), (166, 'Them'),
(167, 'he'), (167, 'I'), (167, 'we'), (167, 'they'), (167, 'you'), (167, 'it'), (167, 'her'), (167, 'his'), (167, 'him'), (167, 'them'),
(168, 'He'), (168, 'I'), (168, 'We'), (168, 'They'), (168, 'You'), (168, 'It'), (168, 'Her'), (168, 'His'), (168, 'Him'), (168, 'Them');

-- =============================================================================
-- WORD 22: my (ID: 22, POS: det.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (22, 'my', 'لي / ـي', 'det.', 'Belonging to or associated with the speaker.', 'ينتمي إلى المتحدث أو مرتبط به.', 'لي / ـي', '["خاصتي"]', '{"determiner": "my", "pronoun": "mine"}', '/maɪ/', 'my.mp3', '{"synonyms": [], "antonyms": ["your"], "word_family": ["mine"]}', 'Used as a possessive determiner before a noun.', 'Beginner', 36);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(22, 'This is {my} car.', 'هذه سيارتي.', 'my', 'Possession', 'Easy', 1, 1),
(22, '{My} name is Ahmed.', 'اسمي أحمد.', 'my', 'Identity', 'Easy', 0, 2),
(22, 'I lost {my} keys.', 'فقدت مفاتيحي.', 'my', 'Possession', 'Easy', 0, 3),
(22, '{My} father is a teacher.', 'أبي معلم.', 'my', 'Family', 'Easy', 0, 4),
(22, 'I love {my} country.', 'أنا أحب بلدي.', 'my', 'Emotion', 'Easy', 0, 5),
(22, 'Where is {my} phone?', 'أين هاتفي؟', 'my', 'Possession', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(22, 'translation_match', 'easy', 'my', 'en', 'لي / ـي', 'determiner', NULL, NULL, NULL, '"my" is the possessive form for the speaker.'),
(22, 'reverse_translation', 'easy', 'لي / ـي', 'ar', 'my', 'determiner', NULL, NULL, NULL, 'The Arabic suffix "ـي" translates to "my" in English.'),
(22, 'sentence_completion', 'easy', '___ house is big.', 'en', 'My', 'determiner', '___ house is big.', 'My house is big.', 0, 'Use "My" to show that the house belongs to you.'),
(22, 'sentence_completion', 'easy', 'I like ___ new job.', 'en', 'my', 'determiner', 'I like ___ new job.', 'I like my new job.', 2, 'Use "my" before the noun "job".'),
(22, 'sentence_completion', 'easy', 'This is ___ friend.', 'en', 'my', 'determiner', 'This is ___ friend.', 'This is my friend.', 2, 'Use "my" to introduce someone you know.'),
(22, 'sentence_completion', 'easy', '___ head hurts.', 'en', 'My', 'determiner', '___ head hurts.', 'My head hurts.', 0, 'Use "My" for parts of your body.'),
(22, 'sentence_completion', 'easy', 'I need to wash ___ hands.', 'en', 'my', 'determiner', 'I need to wash ___ hands.', 'I need to wash my hands.', 4, 'Use "my" to show possession of hands.'),
(22, 'sentence_completion', 'easy', '___ favorite color is blue.', 'en', 'My', 'determiner', '___ favorite color is blue.', 'My favorite color is blue.', 0, 'Use "My" to express your preference.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(169, 'لك'), (169, 'له'), (169, 'لها'), (169, 'لنا'), (169, 'لهم'), (169, 'هو'), (169, 'هي'), (169, 'أنا'), (169, 'نحن'), (169, 'هم'),
(170, 'your'), (170, 'his'), (170, 'her'), (170, 'its'), (170, 'our'), (170, 'their'), (170, 'me'), (170, 'mine'), (170, 'I'), (170, 'you'),
(171, 'Your'), (171, 'His'), (171, 'Her'), (171, 'Its'), (171, 'Our'), (171, 'Their'), (171, 'Me'), (171, 'Mine'), (171, 'I'), (171, 'You'),
(172, 'your'), (172, 'his'), (172, 'her'), (172, 'its'), (172, 'our'), (172, 'their'), (172, 'me'), (172, 'mine'), (172, 'I'), (172, 'you'),
(173, 'your'), (173, 'his'), (173, 'her'), (173, 'its'), (173, 'our'), (173, 'their'), (173, 'me'), (173, 'mine'), (173, 'I'), (173, 'you'),
(174, 'Your'), (174, 'His'), (174, 'Her'), (174, 'Its'), (174, 'Our'), (174, 'Their'), (174, 'Me'), (174, 'Mine'), (174, 'I'), (174, 'You'),
(175, 'your'), (175, 'his'), (175, 'her'), (175, 'its'), (175, 'our'), (175, 'their'), (175, 'me'), (175, 'mine'), (175, 'I'), (175, 'you'),
(176, 'Your'), (176, 'His'), (176, 'Her'), (176, 'Its'), (176, 'Our'), (176, 'Their'), (176, 'Me'), (176, 'Mine'), (176, 'I'), (176, 'You');

-- =============================================================================
-- WORD 23: know (ID: 23, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (23, 'know', 'يعرف', 'v.', 'To be aware of through observation, inquiry, or information.', 'أن يكون على دراية من خلال الملاحظة أو الاستفسار أو المعلومات.', 'يعرف', '["يعلم", "يدرك"]', '{"base": "know", "thirdPerson": "knows", "past": "knew", "participle": "known", "gerund": "knowing"}', '/noʊ/', 'know.mp3', '{"synonyms": ["understand", "realize"], "antonyms": ["ignore"], "word_family": ["knowledge"]}', 'Often used for facts, people, or skills.', 'Beginner', 39);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(23, 'I {know} the answer.', 'أنا أعرف الإجابة.', 'know', 'General', 'Easy', 1, 1),
(23, 'She {knows} my brother.', 'هي تعرف أخي.', 'knows', 'Social', 'Easy', 0, 2),
(23, 'I {knew} it was you.', 'كنت أعرف أنه أنت.', 'knew', 'Recognition', 'Easy', 0, 3),
(23, 'It is a well {known} fact.', 'إنها حقيقة معروفة جيداً.', 'known', 'General', 'Easy', 0, 4),
(23, 'Do you {know} how to swim?', 'هل تعرف كيف تسبح؟', 'know', 'Ability', 'Easy', 0, 5),
(23, 'They {know} each other well.', 'يعرفون بعضهم البعض جيداً.', 'know', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(23, 'translation_match', 'easy', 'know', 'en', 'يعرف', 'base', NULL, NULL, NULL, '"know" is the base verb for having information.'),
(23, 'reverse_translation', 'easy', 'يعرف', 'ar', 'know', 'base', NULL, NULL, NULL, 'The Arabic verb "يعرف" translates to "know" in English.'),
(23, 'sentence_completion', 'easy', 'I ___ his name.', 'en', 'know', 'base', 'I ___ his name.', 'I know his name.', 1, 'Use the base form "know" with the pronoun "I".'),
(23, 'sentence_completion', 'easy', 'He ___ the way home.', 'en', 'knows', 'thirdPerson', 'He ___ the way home.', 'He knows the way home.', 1, 'Use "knows" for third-person singular present.'),
(23, 'sentence_completion', 'easy', 'I ___ you would come!', 'en', 'knew', 'past', 'I ___ you would come!', 'I knew you would come!', 1, 'Use "knew" for the past tense of "know".'),
(23, 'sentence_completion', 'easy', 'He is ___ for his kindness.', 'en', 'known', 'participle', 'He is ___ for his kindness.', 'He is known for his kindness.', 2, 'Use "known" as the past participle.'),
(23, 'sentence_completion', 'easy', 'They ___ each other well.', 'en', 'know', 'base', 'They ___ each other well.', 'They know each other well.', 1, 'Use "know" for plural subjects.'),
(23, 'sentence_completion', 'easy', 'Do you ___ where he is?', 'en', 'know', 'base', 'Do you ___ where he is?', 'Do you know where he is?', 2, 'Use the base form "know" in a question with "do".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(177, 'يذهب'), (177, 'يأكل'), (177, 'ينام'), (177, 'يرى'), (177, 'يفعل'), (177, 'يقول'), (177, 'يأخذ'), (177, 'يعطي'), (177, 'يأتي'), (177, 'يصنع'),
(178, 'go'), (178, 'eat'), (178, 'sleep'), (178, 'see'), (178, 'do'), (178, 'say'), (178, 'take'), (178, 'give'), (178, 'come'), (178, 'make'),
(179, 'knows'), (179, 'knew'), (179, 'known'), (179, 'knowing'), (179, 'goes'), (179, 'sees'), (179, 'takes'), (179, 'gives'), (179, 'comes'), (179, 'makes'),
(180, 'know'), (180, 'knew'), (180, 'known'), (180, 'knowing'), (180, 'go'), (180, 'see'), (180, 'take'), (180, 'give'), (180, 'come'), (180, 'make'),
(181, 'know'), (181, 'knows'), (181, 'known'), (181, 'knowing'), (181, 'go'), (181, 'see'), (181, 'take'), (181, 'give'), (181, 'come'), (181, 'make'),
(182, 'know'), (182, 'knows'), (182, 'knew'), (182, 'knowing'), (182, 'go'), (182, 'see'), (182, 'take'), (182, 'give'), (182, 'come'), (182, 'make'),
(183, 'knows'), (183, 'knew'), (183, 'known'), (183, 'knowing'), (183, 'go'), (183, 'see'), (183, 'take'), (183, 'give'), (183, 'come'), (183, 'make'),
(184, 'knows'), (184, 'knew'), (184, 'known'), (184, 'knowing'), (184, 'go'), (184, 'see'), (184, 'take'), (184, 'give'), (184, 'come'), (184, 'make');

-- =============================================================================
-- WORD 24: if (ID: 24, POS: conj.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (24, 'if', 'إذا', 'conj.', 'Used to introduce a conditional clause.', 'يستخدم لتقديم جملة شرطية.', 'إذا', '["لو", "إن"]', '{"base": "if"}', '/ɪf/', 'if.mp3', '{"synonyms": ["provided that", "whether"], "antonyms": [], "word_family": []}', 'Essential for expressing conditions and possibilities.', 'Beginner', 40);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(24, '{If} it rains, we will stay home.', 'إذا أمطرت، سنبقى في المنزل.', 'if', 'Weather', 'Easy', 1, 1),
(24, 'I will go {if} you go.', 'سأذهب إذا ذهبت أنت.', 'if', 'Social', 'Easy', 0, 2),
(24, 'Ask him {if} he is ready.', 'اسأله إذا كان مستعداً.', 'if', 'Inquiry', 'Easy', 0, 3),
(24, '{If} you need help, tell me.', 'إذا كنت بحاجة للمساعدة، أخبرني.', 'if', 'Support', 'Easy', 0, 4),
(24, 'I wonder {if} she knows.', 'أتساءل عما إذا كانت تعرف.', 'if', 'Thought', 'Easy', 0, 5),
(24, 'Call me {if} there is a problem.', 'اتصل بي إذا كانت هناك مشكلة.', 'if', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(24, 'translation_match', 'easy', 'if', 'en', 'إذا', 'base', NULL, NULL, NULL, '"if" is the primary conjunction for conditions.'),
(24, 'reverse_translation', 'easy', 'إذا', 'ar', 'if', 'base', NULL, NULL, NULL, 'The Arabic "إذا" translates to "if" in English.'),
(24, 'sentence_completion', 'easy', '___ you study, you will pass.', 'en', 'If', 'base', '___ you study, you will pass.', 'If you study, you will pass.', 0, 'Use "If" to introduce a condition for success.'),
(24, 'sentence_completion', 'easy', 'I don''t know ___ I can come.', 'en', 'if', 'base', 'I don''t know ___ I can come.', 'I don''t know if I can come.', 3, 'Use "if" to express uncertainty or a choice.'),
(24, 'sentence_completion', 'easy', '___ only I had more time.', 'en', 'If', 'base', '___ only I had more time.', 'If only I had more time.', 0, 'Use "If only" to express a strong wish.'),
(24, 'sentence_completion', 'easy', 'See ___ the door is locked.', 'en', 'if', 'base', 'See ___ the door is locked.', 'See if the door is locked.', 1, 'Use "if" to check a condition.'),
(24, 'sentence_completion', 'easy', '___ you are tired, rest.', 'en', 'If', 'base', '___ you are tired, rest.', 'If you are tired, rest.', 0, 'Use "If" to provide advice based on a condition.'),
(24, 'sentence_completion', 'easy', 'I will buy it ___ it is cheap.', 'en', 'if', 'base', 'I will buy it ___ it is cheap.', 'I will buy it if it is cheap.', 4, 'Use "if" to set a condition for a purchase.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(185, 'و'), (185, 'لكن'), (185, 'أو'), (185, 'لأن'), (185, 'عندما'), (185, 'ثم'), (185, 'حتى'), (185, 'بينما'), (185, 'منذ'), (185, 'قبل'),
(186, 'and'), (186, 'but'), (186, 'or'), (186, 'because'), (186, 'when'), (186, 'then'), (186, 'until'), (186, 'while'), (186, 'since'), (186, 'before'),
(187, 'And'), (187, 'But'), (187, 'Or'), (187, 'Because'), (187, 'When'), (187, 'Then'), (187, 'Until'), (187, 'While'), (187, 'Since'), (187, 'Before'),
(188, 'and'), (188, 'but'), (188, 'or'), (188, 'because'), (188, 'when'), (188, 'then'), (188, 'until'), (188, 'while'), (188, 'since'), (188, 'before'),
(189, 'And'), (189, 'But'), (189, 'Or'), (189, 'Because'), (189, 'When'), (189, 'Then'), (189, 'Until'), (189, 'While'), (189, 'Since'), (189, 'Before'),
(190, 'and'), (190, 'but'), (190, 'or'), (190, 'because'), (190, 'when'), (190, 'then'), (190, 'until'), (190, 'while'), (190, 'since'), (190, 'before'),
(191, 'And'), (191, 'But'), (191, 'Or'), (191, 'Because'), (191, 'When'), (191, 'Then'), (191, 'Until'), (191, 'While'), (191, 'Since'), (191, 'Before'),
(192, 'and'), (192, 'but'), (192, 'or'), (192, 'because'), (192, 'when'), (192, 'then'), (192, 'until'), (192, 'while'), (192, 'since'), (192, 'before');

-- =============================================================================
-- WORD 25: me (ID: 25, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (25, 'me', 'ني / لي', 'pron.', 'Used by a speaker to refer to himself or herself as the object of a verb or preposition.', 'يستخدمه المتحدث للإشارة إلى نفسه كمفعول به لفعل أو حرف جر.', 'ني / لي', '["إياي"]', '{"object": "me"}', '/miː/', 'me.mp3', '{"synonyms": [], "antonyms": [], "word_family": ["I", "my", "mine", "myself"]}', 'The object form of the pronoun "I".', 'Beginner', 41);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(25, 'Can you help {me}?', 'هل يمكنك مساعدتي؟', 'me', 'Requests', 'Easy', 1, 1),
(25, 'He gave {me} a book.', 'أعطاني كتاباً.', 'me', 'Giving', 'Easy', 0, 2),
(25, 'She saw {me} at the park.', 'رأتني في الحديقة.', 'me', 'Social', 'Easy', 0, 3),
(25, 'Talk to {me}, please.', 'تحدث إلي، من فضلك.', 'me', 'Communication', 'Easy', 0, 4),
(25, 'Wait for {me}!', 'انتظرني!', 'me', 'Requests', 'Easy', 0, 5),
(25, 'Look at {me}.', 'انظر إلي.', 'me', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(25, 'translation_match', 'easy', 'me', 'en', 'ني / لي', 'object', NULL, NULL, NULL, '"me" is the object pronoun for the speaker.'),
(25, 'reverse_translation', 'easy', 'ني / لي', 'ar', 'me', 'object', NULL, NULL, NULL, 'The Arabic suffix "ني" or "لي" translates to "me".'),
(25, 'sentence_completion', 'easy', 'Help ___ with this bag.', 'en', 'me', 'object', 'Help ___ with this bag.', 'Help me with this bag.', 1, 'Use "me" as the object of the verb "help".'),
(25, 'sentence_completion', 'easy', 'Give it to ___.', 'en', 'me', 'object', 'Give it to ___.', 'Give it to me.', 3, 'Use "me" after the preposition "to".'),
(25, 'sentence_completion', 'easy', 'He saw ___ yesterday.', 'en', 'me', 'object', 'He saw ___ yesterday.', 'He saw me yesterday.', 2, 'Use "me" as the object of the verb "saw".'),
(25, 'sentence_completion', 'easy', 'Tell ___ the truth.', 'en', 'me', 'object', 'Tell ___ the truth.', 'Tell me the truth.', 1, 'Use "me" as the indirect object of "tell".'),
(25, 'sentence_completion', 'easy', 'Wait for ___!', 'en', 'me', 'object', 'Wait for ___!', 'Wait for me!', 2, 'Use "me" after the preposition "for".'),
(25, 'sentence_completion', 'easy', 'Look at ___ now.', 'en', 'me', 'object', 'Look at ___ now.', 'Look at me now.', 2, 'Use "me" after the preposition "at".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(193, 'هو'), (193, 'هي'), (193, 'نحن'), (193, 'هم'), (193, 'أنت'), (193, 'إياه'), (193, 'إياها'), (193, 'إيانا'), (193, 'إياهم'), (193, 'إياك'),
(194, 'him'), (194, 'her'), (194, 'us'), (194, 'them'), (194, 'you'), (194, 'it'), (194, 'my'), (194, 'your'), (194, 'his'), (194, 'their'),
(195, 'I'), (195, 'my'), (195, 'mine'), (195, 'myself'), (195, 'him'), (195, 'her'), (195, 'us'), (195, 'them'), (195, 'you'), (195, 'it'),
(196, 'I'), (196, 'my'), (196, 'mine'), (196, 'myself'), (196, 'him'), (196, 'her'), (196, 'us'), (196, 'them'), (196, 'you'), (196, 'it'),
(197, 'I'), (197, 'my'), (197, 'mine'), (197, 'myself'), (197, 'him'), (197, 'her'), (197, 'us'), (197, 'them'), (197, 'you'), (197, 'it'),
(198, 'I'), (198, 'my'), (198, 'mine'), (198, 'myself'), (198, 'him'), (198, 'her'), (198, 'us'), (198, 'them'), (198, 'you'), (198, 'it'),
(199, 'I'), (199, 'my'), (199, 'mine'), (199, 'myself'), (199, 'him'), (199, 'her'), (199, 'us'), (199, 'them'), (199, 'you'), (199, 'it'),
(200, 'I'), (200, 'my'), (200, 'mine'), (200, 'myself'), (200, 'him'), (200, 'her'), (200, 'us'), (200, 'them'), (200, 'you'), (200, 'it');

-- =============================================================================
-- WORD 26: your (ID: 26, POS: det.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (26, 'your', 'لك / ـك', 'det.', 'Belonging to or associated with the person or people that the speaker is addressing.', 'ينتمي إلى أو يرتبط بالشخص أو الأشخاص الذين يخاطبهم المتحدث.', 'لك / ـك', '["خاصتك", "لكم"]', '{"determiner": "your"}', '/jɔːr/', 'your.mp3', '{"synonyms": [], "antonyms": ["my"], "word_family": ["yours", "yourself"]}', 'Possessive determiner used before a noun.', 'Beginner', 42);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(26, 'What is {your} name?', 'ما اسمك؟', 'your', 'Identity', 'Easy', 1, 1),
(26, 'Is this {your} car?', 'هل هذه سيارتك؟', 'your', 'Possession', 'Easy', 0, 2),
(26, 'I like {your} new house.', 'يعجبني منزلك الجديد.', 'your', 'Home', 'Easy', 0, 3),
(26, 'Wash {your} hands.', 'اغسل يديك.', 'your', 'Health', 'Easy', 0, 4),
(26, 'Where is {your} brother?', 'أين أخوك؟', 'your', 'Family', 'Easy', 0, 5),
(26, 'Take {your} time.', 'خذ وقتك.', 'your', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(26, 'translation_match', 'easy', 'your', 'en', 'لك / ـك', 'determiner', NULL, NULL, NULL, '"your" is the possessive form for the person being spoken to.'),
(26, 'reverse_translation', 'easy', 'لك / ـك', 'ar', 'your', 'determiner', NULL, NULL, NULL, 'The Arabic suffix "ـك" translates to "your" in English.'),
(26, 'sentence_completion', 'easy', 'This is ___ book.', 'en', 'your', 'determiner', 'This is ___ book.', 'This is your book.', 2, 'Use "your" to show possession by the listener.'),
(26, 'sentence_completion', 'easy', '___ father is very tall.', 'en', 'Your', 'determiner', '___ father is very tall.', 'Your father is very tall.', 0, 'Use "Your" at the start of a sentence to show possession.'),
(26, 'sentence_completion', 'easy', 'I found ___ keys.', 'en', 'your', 'determiner', 'I found ___ keys.', 'I found your keys.', 2, 'Use "your" before the noun "keys".'),
(26, 'sentence_completion', 'easy', 'Is that ___ friend?', 'en', 'your', 'determiner', 'Is that ___ friend?', 'Is that your friend?', 2, 'Use "your" to ask about someone associated with the listener.'),
(26, 'sentence_completion', 'easy', 'Open ___ eyes.', 'en', 'your', 'determiner', 'Open ___ eyes.', 'Open your eyes.', 1, 'Use "your" for parts of the listener''s body.'),
(26, 'sentence_completion', 'easy', '___ help was great.', 'en', 'Your', 'determiner', '___ help was great.', 'Your help was great.', 0, 'Use "Your" to refer to an action performed by the listener.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(201, 'لي'), (201, 'له'), (201, 'لها'), (201, 'لنا'), (201, 'لهم'), (201, 'أنا'), (201, 'هو'), (201, 'هي'), (201, 'نحن'), (201, 'هم'),
(202, 'my'), (202, 'his'), (202, 'her'), (202, 'its'), (202, 'our'), (202, 'their'), (202, 'me'), (202, 'you'), (202, 'him'), (202, 'them'),
(203, 'my'), (203, 'his'), (203, 'her'), (203, 'its'), (203, 'our'), (203, 'their'), (203, 'me'), (203, 'you'), (203, 'him'), (203, 'them'),
(204, 'My'), (204, 'His'), (204, 'Her'), (204, 'Its'), (204, 'Our'), (204, 'Their'), (204, 'Me'), (204, 'You'), (204, 'Him'), (204, 'Them'),
(205, 'my'), (205, 'his'), (205, 'her'), (205, 'its'), (205, 'our'), (205, 'their'), (205, 'me'), (205, 'you'), (205, 'him'), (205, 'them'),
(206, 'my'), (206, 'his'), (206, 'her'), (206, 'its'), (206, 'our'), (206, 'their'), (206, 'me'), (206, 'you'), (206, 'him'), (206, 'them'),
(207, 'my'), (207, 'his'), (207, 'her'), (207, 'its'), (207, 'our'), (207, 'their'), (207, 'me'), (207, 'you'), (207, 'him'), (207, 'them'),
(208, 'My'), (208, 'His'), (208, 'Her'), (208, 'Its'), (208, 'Our'), (208, 'Their'), (208, 'Me'), (208, 'You'), (208, 'Him'), (208, 'Them');

-- =============================================================================
-- WORD 27: who (ID: 27, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (27, 'who', 'من', 'pron.', 'What or which person or people.', 'أي شخص أو أشخاص.', 'من', '["الذي"]', '{"subject": "who", "object": "whom", "possessive": "whose"}', '/huː/', 'who.mp3', '{"synonyms": [], "antonyms": [], "word_family": ["whoever"]}', 'Used to ask about people or as a relative pronoun.', 'Beginner', 44);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(27, '{Who} is that man?', 'من ذلك الرجل؟', 'who', 'Identity', 'Easy', 1, 1),
(27, 'I know {who} did it.', 'أعرف من فعل ذلك.', 'who', 'General', 'Easy', 0, 2),
(27, '{Who} wants some cake?', 'من يريد بعض الكعك؟', 'who', 'Social', 'Easy', 0, 3),
(27, 'The girl {who} lives next door is nice.', 'الفتاة التي تعيش في المنزل المجاور لطيفة.', 'who', 'Description', 'Easy', 0, 4),
(27, '{Who} are you calling?', 'بمن تتصل؟', 'who', 'Communication', 'Easy', 0, 5),
(27, '{Who} is coming to the party?', 'من سيأتي إلى الحفلة؟', 'who', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(27, 'translation_match', 'easy', 'who', 'en', 'من', 'subject', NULL, NULL, NULL, '"who" is used to ask about the identity of a person.'),
(27, 'reverse_translation', 'easy', 'من', 'ar', 'who', 'subject', NULL, NULL, NULL, 'The Arabic "من" translates to "who" in English.'),
(27, 'sentence_completion', 'easy', '___ is your teacher?', 'en', 'Who', 'subject', '___ is your teacher?', 'Who is your teacher?', 0, 'Use "Who" to ask about a person''s identity.'),
(27, 'sentence_completion', 'easy', '___ did you see?', 'en', 'Who', 'subject', '___ did you see?', 'Who did you see?', 0, 'Use "Who" to ask about the object of a verb in common English.'),
(27, 'sentence_completion', 'easy', 'I don''t know ___ he is.', 'en', 'who', 'subject', 'I don''t know ___ he is.', 'I don''t know who he is.', 3, 'Use "who" to refer to an unknown person.'),
(27, 'sentence_completion', 'easy', 'The man ___ called was my uncle.', 'en', 'who', 'subject', 'The man ___ called was my uncle.', 'The man who called was my uncle.', 2, 'Use "who" as a relative pronoun for people.'),
(27, 'sentence_completion', 'easy', '___ wants to go first?', 'en', 'Who', 'subject', '___ wants to go first?', 'Who wants to go first?', 0, 'Use "Who" to ask which person wants to do something.'),
(27, 'sentence_completion', 'easy', '___ is at the door?', 'en', 'Who', 'subject', '___ is at the door?', 'Who is at the door?', 0, 'Use "Who" to ask about an unidentified person.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(209, 'ماذا'), (209, 'متى'), (209, 'أين'), (209, 'لماذا'), (209, 'كيف'), (209, 'أي'), (209, 'كم'), (209, 'هل'), (209, 'الذي'), (209, 'هذا'),
(210, 'what'), (210, 'when'), (210, 'where'), (210, 'why'), (210, 'how'), (210, 'which'), (210, 'whose'), (210, 'whom'), (210, 'that'), (210, 'this'),
(211, 'What'), (211, 'When'), (211, 'Where'), (211, 'Why'), (211, 'How'), (211, 'Which'), (211, 'Whose'), (211, 'Whom'), (211, 'That'), (211, 'This'),
(212, 'What'), (212, 'When'), (212, 'Where'), (212, 'Why'), (212, 'How'), (212, 'Which'), (212, 'Whose'), (212, 'Whom'), (212, 'That'), (212, 'This'),
(213, 'what'), (213, 'when'), (213, 'where'), (213, 'why'), (213, 'how'), (213, 'which'), (213, 'whose'), (213, 'whom'), (213, 'that'), (213, 'this'),
(214, 'what'), (214, 'when'), (214, 'where'), (214, 'why'), (214, 'how'), (214, 'which'), (214, 'whose'), (214, 'whom'), (214, 'that'), (214, 'this'),
(215, 'What'), (215, 'When'), (215, 'Where'), (215, 'Why'), (215, 'How'), (215, 'Which'), (215, 'Whose'), (215, 'Whom'), (215, 'That'), (215, 'This'),
(216, 'What'), (216, 'When'), (216, 'Where'), (216, 'Why'), (216, 'How'), (216, 'Which'), (216, 'Whose'), (216, 'Whom'), (216, 'That'), (216, 'This');

-- =============================================================================
-- WORD 28: their (ID: 28, POS: det.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (28, 'their', 'لهم / ـهم', 'det.', 'Belonging to or associated with the people or things previously mentioned.', 'ينتمي إلى الأشخاص أو الأشياء المذكورة سابقاً أو مرتبط بها.', 'لهم / ـهم', '["خاصتهم"]', '{"determiner": "their"}', '/ðɛər/', 'their.mp3', '{"synonyms": [], "antonyms": [], "word_family": ["theirs", "them", "they"]}', 'Possessive determiner used before a noun.', 'Beginner', 46);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(28, 'This is {their} house.', 'هذا منزلهم.', 'their', 'Home', 'Easy', 1, 1),
(28, '{Their} children are at school.', 'أطفالهم في المدرسة.', 'their', 'Family', 'Easy', 0, 2),
(28, 'I like {their} new car.', 'تعجبني سيارتهم الجديدة.', 'their', 'Possession', 'Easy', 0, 3),
(28, 'They lost {their} way.', 'ضلوا طريقهم.', 'their', 'Travel', 'Easy', 0, 4),
(28, '{Their} dog is very friendly.', 'كلبهم ودود للغاية.', 'their', 'Animals', 'Easy', 0, 5),
(28, 'What are {their} names?', 'ما هي أسماؤهم؟', 'their', 'Identity', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(28, 'translation_match', 'easy', 'their', 'en', 'لهم / ـهم', 'determiner', NULL, NULL, NULL, '"their" is the possessive form for "they".'),
(28, 'reverse_translation', 'easy', 'لهم / ـهم', 'ar', 'their', 'determiner', NULL, NULL, NULL, 'The Arabic suffix "ـهم" translates to "their" in English.'),
(28, 'sentence_completion', 'easy', 'They are washing ___ car.', 'en', 'their', 'determiner', 'They are washing ___ car.', 'They are washing their car.', 3, 'Use "their" to show possession by "they".'),
(28, 'sentence_completion', 'easy', '___ parents are very kind.', 'en', 'Their', 'determiner', '___ parents are very kind.', 'Their parents are very kind.', 0, 'Use "Their" at the start of a sentence to show possession.'),
(28, 'sentence_completion', 'easy', 'The students finished ___ homework.', 'en', 'their', 'determiner', 'The students finished ___ homework.', 'The students finished their homework.', 3, 'Use "their" to refer to the students'' work.'),
(28, 'sentence_completion', 'easy', 'I don''t know ___ address.', 'en', 'their', 'determiner', 'I don''t know ___ address.', 'I don''t know their address.', 3, 'Use "their" before the noun "address".'),
(28, 'sentence_completion', 'easy', 'Birds build ___ nests in trees.', 'en', 'their', 'determiner', 'Birds build ___ nests in trees.', 'Birds build their nests in trees.', 2, 'Use "their" for plural animals.'),
(28, 'sentence_completion', 'easy', '___ favorite sport is football.', 'en', 'Their', 'determiner', '___ favorite sport is football.', 'Their favorite sport is football.', 0, 'Use "Their" to indicate the group''s preference.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(217, 'له'), (217, 'لها'), (217, 'لي'), (217, 'لنا'), (217, 'لك'), (217, 'هناك'), (217, 'هم'), (217, 'هي'), (217, 'هو'), (217, 'أنا'),
(218, 'there'), (218, 'they'), (218, 'them'), (218, 'his'), (218, 'her'), (218, 'my'), (218, 'our'), (218, 'your'), (218, 'its'), (218, 'theirs'),
(219, 'there'), (219, 'they'), (219, 'them'), (219, 'his'), (219, 'her'), (219, 'my'), (219, 'our'), (219, 'your'), (219, 'its'), (219, 'theirs'),
(220, 'There'), (220, 'They'), (220, 'Them'), (220, 'His'), (220, 'Her'), (220, 'My'), (220, 'Our'), (220, 'Your'), (220, 'Its'), (220, 'Theirs'),
(221, 'there'), (221, 'they'), (221, 'them'), (221, 'his'), (221, 'her'), (221, 'my'), (221, 'our'), (221, 'your'), (221, 'its'), (221, 'theirs'),
(222, 'there'), (222, 'they'), (222, 'them'), (222, 'his'), (222, 'her'), (222, 'my'), (222, 'our'), (222, 'your'), (222, 'its'), (222, 'theirs'),
(223, 'there'), (223, 'they'), (223, 'them'), (223, 'his'), (223, 'her'), (223, 'my'), (223, 'our'), (223, 'your'), (223, 'its'), (223, 'theirs'),
(224, 'There'), (224, 'They'), (224, 'Them'), (224, 'His'), (224, 'Her'), (224, 'My'), (224, 'Our'), (224, 'Your'), (224, 'Its'), (224, 'Theirs');

-- =============================================================================
-- WORD 29: would (ID: 29, POS: modal v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (29, 'would', 'ودّ / قد', 'modal v.', 'Used to indicate a consequence, a polite request, or a past habit.', 'يستخدم للإشارة إلى نتيجة، أو طلب مهذب، أو عادة في الماضي.', 'ودّ / قد', '["سوف (في الماضي)", "لو"]', '{"base": "would", "negative": "wouldn''t"}', '/wʊd/', 'would.mp3', '{"synonyms": ["will (past)"], "antonyms": [], "word_family": []}', 'Often used in conditional sentences and for politeness.', 'Beginner', 49);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(29, '{Would} you like some tea?', 'هل تود بعض الشاي؟', 'would', 'Social', 'Easy', 1, 1),
(29, 'I {would} go if I could.', 'كنت سأذهب لو استطعت.', 'would', 'Conditionals', 'Easy', 0, 2),
(29, 'He said he {would} help.', 'قال إنه سيساعد.', 'would', 'Communication', 'Easy', 0, 3),
(29, '{Would} you mind opening the window?', 'هل تمانع في فتح النافذة؟', 'would', 'Requests', 'Easy', 0, 4),
(29, 'I {would} like to see him.', 'أود أن أراه.', 'would', 'Preferences', 'Easy', 0, 5),
(29, 'She {wouldn''t} listen to me.', 'لم تكن لتستمع إلي.', 'wouldn''t', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(29, 'translation_match', 'easy', 'would', 'en', 'ودّ / قد', 'base', NULL, NULL, NULL, '"would" is used for polite requests and conditionals.'),
(29, 'reverse_translation', 'easy', 'ودّ / قد', 'ar', 'would', 'base', NULL, NULL, NULL, 'The Arabic "ودّ" or "سـ" (in past context) translates to "would".'),
(29, 'sentence_completion', 'easy', '___ you like to dance?', 'en', 'Would', 'base', '___ you like to dance?', 'Would you like to dance?', 0, 'Use "Would" to make a polite offer.'),
(29, 'sentence_completion', 'easy', 'I ___ love to visit Paris.', 'en', 'would', 'base', 'I ___ love to visit Paris.', 'I would love to visit Paris.', 1, 'Use "would" to express a strong desire.'),
(29, 'sentence_completion', 'easy', 'If I were you, I ___ go.', 'en', 'would', 'base', 'If I were you, I ___ go.', 'If I were you, I would go.', 5, 'Use "would" in the second conditional.'),
(29, 'sentence_completion', 'easy', '___ you please help me?', 'en', 'Would', 'base', '___ you please help me?', 'Would you please help me?', 0, 'Use "Would" for polite requests.'),
(29, 'sentence_completion', 'easy', 'He ___ not do it.', 'en', 'would', 'base', 'He ___ not do it.', 'He would not do it.', 1, 'Use "would" for refusal in the past or conditional.'),
(29, 'sentence_completion', 'easy', 'I knew it ___ happen.', 'en', 'would', 'base', 'I knew it ___ happen.', 'I knew it would happen.', 3, 'Use "would" as the past tense of "will".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(225, 'كان'), (225, 'من'), (225, 'في'), (225, 'على'), (225, 'مع'), (225, 'عن'), (225, 'بـ'), (225, 'و'), (225, 'أو'), (225, 'لكن'),
(226, 'will'), (226, 'can'), (226, 'must'), (226, 'should'), (226, 'do'), (226, 'did'), (226, 'was'), (226, 'is'), (226, 'has'), (226, 'may'),
(227, 'Will'), (227, 'Can'), (227, 'Must'), (227, 'Should'), (227, 'Do'), (227, 'Did'), (227, 'Was'), (227, 'Is'), (227, 'Has'), (227, 'May'),
(228, 'will'), (228, 'can'), (228, 'must'), (228, 'should'), (228, 'do'), (228, 'did'), (228, 'was'), (228, 'is'), (228, 'has'), (228, 'may'),
(229, 'will'), (229, 'can'), (229, 'must'), (229, 'should'), (229, 'do'), (229, 'did'), (229, 'was'), (229, 'is'), (229, 'has'), (229, 'may'),
(230, 'Will'), (230, 'Can'), (230, 'Must'), (230, 'Should'), (230, 'Do'), (230, 'Did'), (230, 'Was'), (230, 'Is'), (230, 'Has'), (230, 'May'),
(231, 'will'), (231, 'can'), (231, 'must'), (231, 'should'), (231, 'do'), (231, 'did'), (231, 'was'), (231, 'is'), (231, 'has'), (231, 'may'),
(232, 'will'), (232, 'can'), (232, 'must'), (232, 'should'), (232, 'do'), (232, 'did'), (232, 'was'), (232, 'is'), (232, 'has'), (232, 'may');

-- =============================================================================
-- WORD 30: make (ID: 30, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (30, 'make', 'يصنع', 'v.', 'To create or produce something.', 'خلق أو إنتاج شيء ما.', 'يصنع', '["يفعل", "يجعل"]', '{"base": "make", "thirdPerson": "makes", "past": "made", "participle": "made", "gerund": "making"}', '/meɪk/', 'make.mp3', '{"synonyms": ["create", "produce", "build"], "antonyms": ["destroy", "break"], "word_family": ["maker", "making"]}', 'Often used for physical creation or causing a state.', 'Beginner', 50);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(30, 'I {make} breakfast every morning.', 'أنا أصنع الفطور كل صباح.', 'make', 'Routine', 'Easy', 1, 1),
(30, 'She {makes} beautiful dresses.', 'هي تصنع فساتين جميلة.', 'makes', 'Creation', 'Easy', 0, 2),
(30, 'He {made} a big mistake.', 'لقد ارتكب خطأً كبيراً.', 'made', 'Past Events', 'Easy', 0, 3),
(30, 'They are {making} a lot of noise.', 'إنهم يصدرون الكثير من الضجيج.', 'making', 'Current Action', 'Easy', 0, 4),
(30, 'This table was {made} in Italy.', 'هذه الطاولة صُنعت في إيطاليا.', 'made', 'Origin', 'Easy', 0, 5),
(30, 'Can you {make} some tea?', 'هل يمكنك صنع بعض الشاي؟', 'make', 'Requests', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(30, 'translation_match', 'easy', 'make', 'en', 'يصنع', 'base', NULL, NULL, NULL, '"make" is the base verb for creating or producing.'),
(30, 'reverse_translation', 'easy', 'يصنع', 'ar', 'make', 'base', NULL, NULL, NULL, 'The Arabic verb "يصنع" translates to "make".'),
(30, 'sentence_completion', 'easy', 'I want to ___ a cake.', 'en', 'make', 'base', 'I want to ___ a cake.', 'I want to make a cake.', 3, 'Use the base form "make" after "want to".'),
(30, 'sentence_completion', 'easy', 'She ___ her own clothes.', 'en', 'makes', 'thirdPerson', 'She ___ her own clothes.', 'She makes her own clothes.', 1, 'Use "makes" for third-person singular present.'),
(30, 'sentence_completion', 'easy', 'He ___ a phone call yesterday.', 'en', 'made', 'past', 'He ___ a phone call yesterday.', 'He made a phone call yesterday.', 1, 'Use "made" for the past tense of "make".'),
(30, 'sentence_completion', 'easy', 'They are ___ a new plan.', 'en', 'making', 'gerund', 'They are ___ a new plan.', 'They are making a new plan.', 2, 'Use "making" for the present continuous.'),
(30, 'sentence_completion', 'easy', 'The car was ___ in Japan.', 'en', 'made', 'participle', 'The car was ___ in Japan.', 'The car was made in Japan.', 2, 'Use "made" as the past participle in passive voice.'),
(30, 'sentence_completion', 'easy', 'Don''t ___ a mess.', 'en', 'make', 'base', 'Don''t ___ a mess.', 'Don''t make a mess.', 1, 'Use the base form "make" for negative imperatives.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(233, 'يذهب'), (233, 'يأكل'), (233, 'يرى'), (233, 'يأخذ'), (233, 'يعطي'), (233, 'يقول'), (233, 'يحصل'), (233, 'يكون'), (233, 'ينام'), (233, 'يمشي'),
(234, 'go'), (234, 'eat'), (234, 'see'), (234, 'take'), (234, 'give'), (234, 'say'), (234, 'get'), (234, 'be'), (234, 'sleep'), (234, 'walk'),
(235, 'makes'), (235, 'made'), (235, 'making'), (235, 'goes'), (235, 'sees'), (235, 'takes'), (235, 'gives'), (235, 'says'), (235, 'gets'), (235, 'eats'),
(236, 'make'), (236, 'made'), (236, 'making'), (236, 'go'), (236, 'see'), (236, 'take'), (236, 'give'), (236, 'say'), (236, 'get'), (236, 'eat'),
(237, 'make'), (237, 'makes'), (237, 'making'), (237, 'go'), (237, 'see'), (237, 'take'), (237, 'give'), (237, 'say'), (237, 'get'), (237, 'eat'),
(238, 'make'), (238, 'makes'), (238, 'made'), (238, 'go'), (238, 'see'), (238, 'take'), (238, 'give'), (238, 'say'), (238, 'get'), (238, 'eat'),
(239, 'make'), (239, 'makes'), (239, 'making'), (239, 'go'), (239, 'see'), (239, 'take'), (239, 'give'), (239, 'say'), (239, 'get'), (239, 'eat'),
(240, 'makes'), (240, 'made'), (240, 'making'), (240, 'go'), (240, 'see'), (240, 'take'), (240, 'give'), (240, 'say'), (240, 'get'), (240, 'eat');

-- =============================================================================
-- WORD 31: think (ID: 31, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (31, 'think', 'يفكر', 'v.', 'To have a particular opinion, belief, or idea about someone or something.', 'أن يكون لديك رأي أو معتقد أو فكرة معينة حول شخص ما أو شيء ما.', 'يفكر', '["يعتقد", "يظن"]', '{"base": "think", "thirdPerson": "thinks", "past": "thought", "participle": "thought", "gerund": "thinking"}', '/θɪŋk/', 'think.mp3', '{"synonyms": ["believe", "imagine"], "antonyms": ["forget"], "word_family": ["thought", "thinking"]}', 'Commonly used to express opinions or mental processes.', 'Beginner', 53);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(31, 'I {think} it is going to rain.', 'أعتقد أنها ستمطر.', 'think', 'Weather', 'Easy', 1, 1),
(31, 'She {thinks} about her family every day.', 'هي تفكر في عائلتها كل يوم.', 'thinks', 'Personal', 'Easy', 0, 2),
(31, 'I {thought} you were at home.', 'ظننت أنك في المنزل.', 'thought', 'Past Opinion', 'Easy', 0, 3),
(31, 'What are you {thinking} about?', 'فيمَ تفكر؟', 'thinking', 'Inquiry', 'Easy', 0, 4),
(31, 'I {think} so too.', 'أنا أظن ذلك أيضاً.', 'think', 'Agreement', 'Easy', 0, 5),
(31, 'He {thought} of a great idea.', 'فكر في فكرة رائعة.', 'thought', 'Creativity', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(31, 'translation_match', 'easy', 'think', 'en', 'يفكر', 'base', NULL, NULL, NULL, '"think" is the base verb for mental activity or opinion.'),
(31, 'reverse_translation', 'easy', 'يفكر', 'ar', 'think', 'base', NULL, NULL, NULL, 'The Arabic verb "يفكر" translates to "think".'),
(31, 'sentence_completion', 'easy', 'I ___ this is the right way.', 'en', 'think', 'base', 'I ___ this is the right way.', 'I think this is the right way.', 1, 'Use the base form "think" with the pronoun "I".'),
(31, 'sentence_completion', 'easy', 'He ___ he is very smart.', 'en', 'thinks', 'thirdPerson', 'He ___ he is very smart.', 'He thinks he is very smart.', 1, 'Use "thinks" for third-person singular present.'),
(31, 'sentence_completion', 'easy', 'I ___ about it all night.', 'en', 'thought', 'past', 'I ___ about it all night.', 'I thought about it all night.', 1, 'Use "thought" for the past tense of "think".'),
(31, 'sentence_completion', 'easy', 'Stop ___ and start doing.', 'en', 'thinking', 'gerund', 'Stop ___ and start doing.', 'Stop thinking and start doing.', 1, 'Use "thinking" as the gerund after "stop".'),
(31, 'sentence_completion', 'easy', 'I have ___ about your offer.', 'en', 'thought', 'participle', 'I have ___ about your offer.', 'I have thought about your offer.', 2, 'Use "thought" as the past participle after "have".'),
(31, 'sentence_completion', 'easy', 'Do you ___ it is possible?', 'en', 'think', 'base', 'Do you ___ it is possible?', 'Do you think it is possible?', 2, 'Use the base form "think" in a question with "do".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(241, 'يأكل'), (241, 'ينام'), (241, 'يرى'), (241, 'يذهب'), (241, 'يأخذ'), (241, 'يعطي'), (241, 'يقول'), (241, 'يفعل'), (241, 'يصنع'), (241, 'يمشي'),
(242, 'eat'), (242, 'sleep'), (242, 'see'), (242, 'go'), (242, 'take'), (242, 'give'), (242, 'say'), (242, 'do'), (242, 'make'), (242, 'walk'),
(243, 'thinks'), (243, 'thought'), (243, 'thinking'), (243, 'eats'), (243, 'sees'), (243, 'goes'), (243, 'takes'), (243, 'gives'), (243, 'says'), (243, 'makes'),
(244, 'think'), (244, 'thought'), (244, 'thinking'), (244, 'eat'), (244, 'see'), (244, 'go'), (244, 'take'), (244, 'give'), (244, 'say'), (244, 'make'),
(245, 'think'), (245, 'thinks'), (245, 'thinking'), (245, 'eat'), (245, 'see'), (245, 'go'), (245, 'take'), (245, 'give'), (245, 'say'), (245, 'make'),
(246, 'think'), (246, 'thinks'), (246, 'thought'), (246, 'eat'), (246, 'see'), (246, 'go'), (246, 'take'), (246, 'give'), (246, 'say'), (246, 'make'),
(247, 'think'), (247, 'thinks'), (247, 'thinking'), (247, 'eat'), (247, 'see'), (247, 'go'), (247, 'take'), (247, 'give'), (247, 'say'), (247, 'make'),
(248, 'thinks'), (248, 'thought'), (248, 'thinking'), (248, 'eat'), (248, 'see'), (248, 'go'), (248, 'take'), (248, 'give'), (248, 'say'), (248, 'make');

-- =============================================================================
-- WORD 32: see (ID: 32, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (32, 'see', 'يرى', 'v.', 'To perceive with the eyes; to witness or understand.', 'الإدراك بالعينين؛ المشاهدة أو الفهم.', 'يرى', '["يشاهد", "يفهم"]', '{"base": "see", "thirdPerson": "sees", "past": "saw", "participle": "seen", "gerund": "seeing"}', '/siː/', 'see.mp3', '{"synonyms": ["look", "watch"], "antonyms": ["ignore"], "word_family": ["sight", "seeing"]}', 'Commonly used for physical vision and mental understanding.', 'Beginner', 56);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(32, 'I can {see} the mountains from here.', 'أستطيع رؤية الجبال من هنا.', 'see', 'General', 'Easy', 1, 1),
(32, 'He {sees} his friends every weekend.', 'يرى أصدقاءه كل عطلة نهاية أسبوع.', 'sees', 'Social', 'Easy', 0, 2),
(32, 'I {saw} a great movie last night.', 'شاهدت فيلماً رائعاً ليلة أمس.', 'saw', 'Entertainment', 'Easy', 0, 3),
(32, 'Have you {seen} my keys?', 'هل رأيت مفاتيحي؟', 'seen', 'Possession', 'Easy', 0, 4),
(32, 'I am {seeing} a doctor tomorrow.', 'سأقابل طبيباً غداً.', 'seeing', 'Health', 'Easy', 0, 5),
(32, '{See} you later!', 'أراك لاحقاً!', 'see', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(32, 'translation_match', 'easy', 'see', 'en', 'يرى', 'base', NULL, NULL, NULL, '"see" is the base verb for physical vision.'),
(32, 'reverse_translation', 'easy', 'يرى', 'ar', 'see', 'base', NULL, NULL, NULL, 'The Arabic verb "يرى" translates to "see".'),
(32, 'sentence_completion', 'easy', 'I can ___ the ocean.', 'en', 'see', 'base', 'I can ___ the ocean.', 'I can see the ocean.', 2, 'Use the base form "see" after the modal "can".'),
(32, 'sentence_completion', 'easy', 'She ___ her family often.', 'en', 'sees', 'thirdPerson', 'She ___ her family often.', 'She sees her family often.', 1, 'Use "sees" for third-person singular present.'),
(32, 'sentence_completion', 'easy', 'We ___ a rainbow yesterday.', 'en', 'saw', 'past', 'We ___ a rainbow yesterday.', 'We saw a rainbow yesterday.', 1, 'Use "saw" for the past tense of "see".'),
(32, 'sentence_completion', 'easy', 'I have never ___ a lion.', 'en', 'seen', 'participle', 'I have never ___ a lion.', 'I have never seen a lion.', 3, 'Use "seen" as the past participle after "have".'),
(32, 'sentence_completion', 'easy', 'Are you ___ the same thing?', 'en', 'seeing', 'gerund', 'Are you ___ the same thing?', 'Are you seeing the same thing?', 2, 'Use "seeing" for the present continuous.'),
(32, 'sentence_completion', 'easy', '___ the bird in the tree.', 'en', 'See', 'base', '___ the bird in the tree.', 'See the bird in the tree.', 0, 'Use the base form for an imperative command.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(249, 'يسمع'), (249, 'يمشي'), (249, 'يأكل'), (249, 'ينام'), (249, 'يذهب'), (249, 'يأخذ'), (249, 'يعطي'), (249, 'يقول'), (249, 'يفعل'), (249, 'يصنع'),
(250, 'hear'), (250, 'walk'), (250, 'eat'), (250, 'sleep'), (250, 'go'), (250, 'take'), (250, 'give'), (250, 'say'), (250, 'do'), (250, 'make'),
(251, 'sees'), (251, 'saw'), (251, 'seen'), (251, 'seeing'), (251, 'hears'), (251, 'heard'), (251, 'walks'), (251, 'walked'), (251, 'goes'), (251, 'went'),
(252, 'see'), (252, 'saw'), (252, 'seen'), (252, 'seeing'), (252, 'hear'), (252, 'hears'), (252, 'heard'), (252, 'walk'), (252, 'walks'), (252, 'walked'),
(253, 'see'), (253, 'sees'), (253, 'seen'), (253, 'seeing'), (253, 'hear'), (253, 'hears'), (253, 'heard'), (253, 'walk'), (253, 'walks'), (253, 'walked'),
(254, 'see'), (254, 'sees'), (254, 'saw'), (254, 'seeing'), (254, 'hear'), (254, 'hears'), (254, 'heard'), (254, 'walk'), (254, 'walks'), (254, 'walked'),
(255, 'see'), (255, 'sees'), (255, 'saw'), (255, 'seen'), (255, 'hear'), (255, 'hears'), (255, 'heard'), (255, 'walk'), (255, 'walks'), (255, 'walked'),
(256, 'Sees'), (256, 'Saw'), (256, 'Seen'), (256, 'Seeing'), (256, 'Hears'), (256, 'Heard'), (256, 'Walks'), (256, 'Walked'), (256, 'Goes'), (256, 'Went');

-- =============================================================================
-- WORD 33: come (ID: 33, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (33, 'come', 'يأتي', 'v.', 'To move or travel toward or into a place thought of as near or familiar.', 'التحرك أو السفر نحو أو إلى مكان يعتبر قريباً أو مألوفاً.', 'يأتي', '["يحضر", "يقبل"]', '{"base": "come", "thirdPerson": "comes", "past": "came", "participle": "come", "gerund": "coming"}', '/kʌm/', 'come.mp3', '{"synonyms": ["arrive", "approach"], "antonyms": ["go", "leave"], "word_family": ["comer", "coming"]}', 'Irregular verb: come, came, come.', 'Beginner', 61);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(33, 'Please {come} here.', 'من فضلك تعال هنا.', 'come', 'Instruction', 'Easy', 1, 1),
(33, 'He {comes} from Spain.', 'إنه يأتي من إسبانيا.', 'comes', 'Origin', 'Easy', 0, 2),
(33, 'They {came} to the party yesterday.', 'جاءوا إلى الحفلة أمس.', 'came', 'Past Events', 'Easy', 0, 3),
(33, 'Winter is {coming}.', 'الشتاء قادم.', 'coming', 'Nature', 'Easy', 0, 4),
(33, 'Has he {come} home yet?', 'هل عاد إلى المنزل بعد؟', 'come', 'General', 'Easy', 0, 5),
(33, '{Come} in and sit down.', 'تفضل بالدخول واجلس.', 'come', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(33, 'translation_match', 'easy', 'come', 'en', 'يأتي', 'base', NULL, NULL, NULL, '"come" is the base verb for moving toward the speaker.'),
(33, 'reverse_translation', 'easy', 'يأتي', 'ar', 'come', 'base', NULL, NULL, NULL, 'The Arabic verb "يأتي" translates to "come".'),
(33, 'sentence_completion', 'easy', 'Please ___ to my office.', 'en', 'come', 'base', 'Please ___ to my office.', 'Please come to my office.', 1, 'Use the base form "come" for polite requests.'),
(33, 'sentence_completion', 'easy', 'The bus ___ every ten minutes.', 'en', 'comes', 'thirdPerson', 'The bus ___ every ten minutes.', 'The bus comes every ten minutes.', 2, 'Use "comes" for third-person singular present.'),
(33, 'sentence_completion', 'easy', 'My friend ___ to visit me last week.', 'en', 'came', 'past', 'My friend ___ to visit me last week.', 'My friend came to visit me last week.', 2, 'Use "came" for the past tense of "come".'),
(33, 'sentence_completion', 'easy', 'Are you ___ to the cinema tonight?', 'en', 'coming', 'gerund', 'Are you ___ to the cinema tonight?', 'Are you coming to the cinema tonight?', 2, 'Use "coming" for the present continuous action.'),
(33, 'sentence_completion', 'easy', 'He has ___ a long way.', 'en', 'come', 'participle', 'He has ___ a long way.', 'He has come a long way.', 2, 'Use "come" as the past participle after "has".'),
(33, 'sentence_completion', 'easy', '___ back soon!', 'en', 'Come', 'base', '___ back soon!', 'Come back soon!', 0, 'Use the base form "Come" for imperatives.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(257, 'يذهب'), (257, 'يأكل'), (257, 'ينام'), (257, 'يرى'), (257, 'يأخذ'), (257, 'يعطي'), (257, 'يقول'), (257, 'يفعل'), (257, 'يصنع'), (257, 'يحصل'),
(258, 'go'), (258, 'eat'), (258, 'sleep'), (258, 'see'), (258, 'take'), (258, 'give'), (258, 'say'), (258, 'do'), (258, 'make'), (258, 'get'),
(259, 'comes'), (259, 'came'), (259, 'coming'), (259, 'goes'), (259, 'went'), (259, 'gone'), (259, 'going'), (259, 'eats'), (259, 'ate'), (259, 'sees'),
(260, 'come'), (260, 'came'), (260, 'coming'), (260, 'go'), (260, 'goes'), (260, 'went'), (260, 'gone'), (260, 'going'), (260, 'eat'), (260, 'ate'),
(261, 'come'), (261, 'comes'), (261, 'coming'), (261, 'go'), (261, 'goes'), (261, 'went'), (261, 'gone'), (261, 'going'), (261, 'eat'), (261, 'ate'),
(262, 'come'), (262, 'comes'), (262, 'came'), (262, 'go'), (262, 'goes'), (262, 'went'), (262, 'gone'), (262, 'going'), (262, 'eat'), (262, 'ate'),
(263, 'comes'), (263, 'came'), (263, 'coming'), (263, 'go'), (263, 'goes'), (263, 'went'), (263, 'gone'), (263, 'going'), (263, 'eat'), (263, 'ate'),
(264, 'Comes'), (264, 'Came'), (264, 'Coming'), (264, 'Goes'), (264, 'Went'), (264, 'Gone'), (264, 'Going'), (264, 'Eats'), (264, 'Ate'), (264, 'Sees');

-- =============================================================================
-- WORD 34: people (ID: 34, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (34, 'people', 'ناس', 'n.', 'Human beings in general or considered as a group.', 'البشر بشكل عام أو كمجموعة.', 'ناس', '["أشخاص", "شعب"]', '{"singular": "person", "plural": "people"}', '/ˈpiːpl/', 'people.mp3', '{"synonyms": ["persons", "public"], "antonyms": [], "word_family": []}', '"People" is the irregular plural of "person".', 'Beginner', 62);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(34, 'Many {people} live in this city.', 'كثير من الناس يعيشون في هذه المدينة.', 'people', 'General', 'Easy', 1, 1),
(34, 'I like meeting new {people}.', 'أحب مقابلة أشخاص جدد.', 'people', 'Social', 'Easy', 0, 2),
(34, 'Good {people} are always kind.', 'الناس الطيبون دائماً عطوفون.', 'people', 'Personality', 'Easy', 0, 3),
(34, 'How many {people} are there?', 'كم عدد الأشخاص هناك؟', 'people', 'Quantity', 'Easy', 0, 4),
(34, 'Young {people} like music.', 'الشباب يحبون الموسيقى.', 'people', 'Social', 'Easy', 0, 5),
(34, '{People} say it is true.', 'الناس يقولون إنه حقيقي.', 'people', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(34, 'translation_match', 'easy', 'people', 'en', 'ناس', 'plural', NULL, NULL, NULL, '"people" refers to a group of human beings.'),
(34, 'reverse_translation', 'easy', 'ناس', 'ar', 'people', 'plural', NULL, NULL, NULL, 'The Arabic "ناس" translates to "people" in English.'),
(34, 'sentence_completion', 'easy', 'There are many ___ in the park.', 'en', 'people', 'plural', 'There are many ___ in the park.', 'There are many people in the park.', 3, 'Use "people" for more than one person.'),
(34, 'sentence_completion', 'easy', 'He is a very nice ___.', 'en', 'person', 'singular', 'He is a very nice ___.', 'He is a very nice person.', 5, 'Use "person" for a single individual.'),
(34, 'sentence_completion', 'easy', 'Some ___ are very tall.', 'en', 'people', 'plural', 'Some ___ are very tall.', 'Some people are very tall.', 1, 'Use "people" as the plural subject.'),
(34, 'sentence_completion', 'easy', 'I don''t know those ___.', 'en', 'people', 'plural', 'I don''t know those ___.', 'I don''t know those people.', 4, 'Use "people" after the plural demonstrative "those".'),
(34, 'sentence_completion', 'easy', '___ are waiting outside.', 'en', 'People', 'plural', '___ are waiting outside.', 'People are waiting outside.', 0, 'Use "People" as the subject of the sentence.'),
(34, 'sentence_completion', 'easy', 'The city is full of ___.', 'en', 'people', 'plural', 'The city is full of ___.', 'The city is full of people.', 5, 'Use "people" to describe a crowd.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(265, 'حيوانات'), (265, 'أشياء'), (265, 'أماكن'), (265, 'وقت'), (265, 'يوم'), (265, 'سنة'), (265, 'ماء'), (265, 'طعام'), (265, 'بيت'), (265, 'سيارة'),
(266, 'animals'), (266, 'things'), (266, 'places'), (266, 'time'), (266, 'day'), (266, 'year'), (266, 'water'), (266, 'food'), (266, 'house'), (266, 'car'),
(267, 'person'), (267, 'man'), (267, 'woman'), (267, 'child'), (267, 'animal'), (267, 'thing'), (267, 'place'), (267, 'time'), (267, 'day'), (267, 'year'),
(268, 'people'), (268, 'men'), (268, 'women'), (268, 'children'), (268, 'animals'), (268, 'things'), (268, 'places'), (268, 'times'), (268, 'days'), (268, 'years'),
(269, 'person'), (269, 'man'), (269, 'woman'), (269, 'child'), (269, 'animal'), (269, 'thing'), (269, 'place'), (269, 'time'), (269, 'day'), (269, 'year'),
(270, 'person'), (270, 'man'), (270, 'woman'), (270, 'child'), (270, 'animal'), (270, 'thing'), (270, 'place'), (270, 'time'), (270, 'day'), (270, 'year'),
(271, 'Person'), (271, 'Man'), (271, 'Woman'), (271, 'Child'), (271, 'Animal'), (271, 'Thing'), (271, 'Place'), (271, 'Time'), (271, 'Day'), (271, 'Year'),
(272, 'person'), (272, 'man'), (272, 'woman'), (272, 'child'), (272, 'animal'), (272, 'thing'), (272, 'place'), (272, 'time'), (272, 'day'), (272, 'year');

-- =============================================================================
-- WORD 35: take (ID: 35, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (35, 'take', 'يأخذ', 'v.', 'To reach out for and exhibit hold of; to carry or move something.', 'الوصول لشيء والإمساك به؛ حمل أو نقل شيء ما.', 'يأخذ', '["يتناول", "يستغرق"]', '{"base": "take", "thirdPerson": "takes", "past": "took", "participle": "taken", "gerund": "taking"}', '/teɪk/', 'take.mp3', '{"synonyms": ["grab", "carry"], "antonyms": ["give", "put"], "word_family": ["taker", "taking"]}', 'A very versatile verb used in many phrasal verbs.', 'Beginner', 63);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(35, '{Take} a seat, please.', 'تفضل بالجلوس، من فضلك.', 'take', 'Social', 'Easy', 1, 1),
(35, 'He {takes} the bus to work.', 'هو يستقل الحافلة إلى العمل.', 'takes', 'Travel', 'Easy', 0, 2),
(35, 'I {took} a photo of the sunset.', 'التقطت صورة لغروب الشمس.', 'took', 'Hobbies', 'Easy', 0, 3),
(35, 'This seat is already {taken}.', 'هذا المقعد محجوز بالفعل.', 'taken', 'General', 'Easy', 0, 4),
(35, 'I am {taking} a break.', 'أنا آخذ استراحة.', 'taking', 'Routine', 'Easy', 0, 5),
(35, '{Take} your time.', 'خذ وقتك.', 'take', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(35, 'translation_match', 'easy', 'take', 'en', 'يأخذ', 'base', NULL, NULL, NULL, '"take" is the base verb for grabbing or carrying something.'),
(35, 'reverse_translation', 'easy', 'يأخذ', 'ar', 'take', 'base', NULL, NULL, NULL, 'The Arabic verb "يأخذ" translates to "take" in English.'),
(35, 'sentence_completion', 'easy', 'Please ___ this umbrella.', 'en', 'take', 'base', 'Please ___ this umbrella.', 'Please take this umbrella.', 1, 'Use the base form "take" for imperatives.'),
(35, 'sentence_completion', 'easy', 'She ___ her dog for a walk.', 'en', 'takes', 'thirdPerson', 'She ___ her dog for a walk.', 'She takes her dog for a walk.', 1, 'Use "takes" for third-person singular present.'),
(35, 'sentence_completion', 'easy', 'He ___ my pen by mistake.', 'en', 'took', 'past', 'He ___ my pen by mistake.', 'He took my pen by mistake.', 1, 'Use "took" for the past tense of "take".'),
(35, 'sentence_completion', 'easy', 'Has anyone ___ my keys?', 'en', 'taken', 'participle', 'Has anyone ___ my keys?', 'Has anyone taken my keys?', 2, 'Use "taken" as the past participle after "has".'),
(35, 'sentence_completion', 'easy', 'I am ___ a shower.', 'en', 'taking', 'gerund', 'I am ___ a shower.', 'I am taking a shower.', 2, 'Use "taking" for the present continuous.'),
(35, 'sentence_completion', 'easy', 'It will ___ an hour.', 'en', 'take', 'base', 'It will ___ an hour.', 'It will take an hour.', 2, 'Use "take" to indicate duration of time.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(273, 'يعطي'), (273, 'يضع'), (273, 'يذهب'), (273, 'يأكل'), (273, 'ينام'), (273, 'يرى'), (273, 'يفعل'), (273, 'يقول'), (273, 'يأتي'), (273, 'يصنع'),
(274, 'give'), (274, 'put'), (274, 'go'), (274, 'eat'), (274, 'sleep'), (274, 'see'), (274, 'do'), (274, 'say'), (274, 'come'), (274, 'make'),
(275, 'takes'), (275, 'took'), (275, 'taken'), (275, 'taking'), (275, 'gives'), (275, 'gave'), (275, 'given'), (275, 'giving'), (275, 'puts'), (275, 'putting'),
(276, 'take'), (276, 'took'), (276, 'taken'), (276, 'taking'), (276, 'give'), (276, 'gave'), (276, 'given'), (276, 'giving'), (276, 'put'), (276, 'puts'),
(277, 'take'), (277, 'takes'), (277, 'taken'), (277, 'taking'), (277, 'give'), (277, 'gave'), (277, 'given'), (277, 'giving'), (277, 'put'), (277, 'puts'),
(278, 'take'), (278, 'takes'), (278, 'took'), (278, 'taking'), (278, 'give'), (278, 'gave'), (278, 'given'), (278, 'giving'), (278, 'put'), (278, 'puts'),
(279, 'take'), (279, 'takes'), (279, 'took'), (279, 'taken'), (279, 'give'), (279, 'gave'), (279, 'given'), (279, 'giving'), (279, 'put'), (279, 'puts'),
(280, 'takes'), (280, 'took'), (280, 'taken'), (280, 'taking'), (280, 'give'), (280, 'gave'), (280, 'given'), (280, 'giving'), (280, 'put'), (280, 'puts');

-- =============================================================================
-- WORD 36: year (ID: 36, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (36, 'year', 'سنة', 'n.', 'A period of 365 days (or 366 in leap years).', 'فترة 365 يوماً (أو 366 في السنوات الكبيسة).', 'سنة', '["عام"]', '{"singular": "year", "plural": "years"}', '/jɪər/', 'year.mp3', '{"synonyms": ["annum"], "antonyms": [], "word_family": ["yearly"]}', 'Used to measure age and time periods.', 'Beginner', 64);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(36, 'Happy New {Year}!', 'سنة جديدة سعيدة!', 'year', 'Social', 'Easy', 1, 1),
(36, 'I am ten {years} old.', 'عمري عشر سنوات.', 'years', 'Age', 'Easy', 0, 2),
(36, 'I visit my family once a {year}.', 'أزور عائلتي مرة في السنة.', 'year', 'Routine', 'Easy', 0, 3),
(36, 'Last {year} was very good.', 'السنة الماضية كانت جيدة جداً.', 'year', 'Time', 'Easy', 0, 4),
(36, 'Next {year} will be better.', 'السنة القادمة ستكون أفضل.', 'year', 'Time', 'Easy', 0, 5),
(36, 'Five {years} ago, I lived in London.', 'منذ خمس سنوات، كنت أعيش في لندن.', 'years', 'Past Events', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(36, 'translation_match', 'easy', 'year', 'en', 'سنة', 'singular', NULL, NULL, NULL, '"year" is a unit of time equal to 12 months.'),
(36, 'reverse_translation', 'easy', 'سنة', 'ar', 'year', 'singular', NULL, NULL, NULL, 'The Arabic "سنة" translates to "year" in English.'),
(36, 'sentence_completion', 'easy', 'This ___ has been very busy.', 'en', 'year', 'singular', 'This ___ has been very busy.', 'This year has been very busy.', 1, 'Use "year" for a single 12-month period.'),
(36, 'sentence_completion', 'easy', 'She is twenty ___ old.', 'en', 'years', 'plural', 'She is twenty ___ old.', 'She is twenty years old.', 3, 'Use "years" for age greater than one.'),
(36, 'sentence_completion', 'easy', 'We go on holiday every ___.', 'en', 'year', 'singular', 'We go on holiday every ___.', 'We go on holiday every year.', 5, 'Use "year" after "every" to show frequency.'),
(36, 'sentence_completion', 'easy', 'Many ___ have passed.', 'en', 'years', 'plural', 'Many ___ have passed.', 'Many years have passed.', 1, 'Use "years" after "many" to show a long time.'),
(36, 'sentence_completion', 'easy', 'What ___ were you born?', 'en', 'year', 'singular', 'What ___ were you born?', 'What year were you born?', 1, 'Use "year" to ask about a specific date.'),
(36, 'sentence_completion', 'easy', 'I haven''t seen him for a ___.', 'en', 'year', 'singular', 'I haven''t seen him for a ___.', 'I haven''t seen him for a year.', 6, 'Use "year" to indicate a duration of 12 months.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(281, 'يوم'), (281, 'شهر'), (281, 'أسبوع'), (281, 'ساعة'), (281, 'دقيقة'), (281, 'ثانية'), (281, 'وقت'), (281, 'الآن'), (281, 'هنا'), (281, 'هناك'),
(282, 'day'), (282, 'month'), (282, 'week'), (282, 'hour'), (282, 'minute'), (282, 'second'), (282, 'time'), (282, 'now'), (282, 'here'), (282, 'there'),
(283, 'years'), (283, 'day'), (283, 'month'), (283, 'week'), (283, 'hour'), (283, 'minute'), (283, 'second'), (283, 'time'), (283, 'now'), (283, 'here'),
(284, 'year'), (284, 'day'), (284, 'month'), (284, 'week'), (284, 'hour'), (284, 'minute'), (284, 'second'), (284, 'time'), (284, 'now'), (284, 'here'),
(285, 'years'), (285, 'day'), (285, 'month'), (285, 'week'), (285, 'hour'), (285, 'minute'), (285, 'second'), (285, 'time'), (285, 'now'), (285, 'here'),
(286, 'year'), (286, 'day'), (286, 'month'), (286, 'week'), (286, 'hour'), (286, 'minute'), (286, 'second'), (286, 'time'), (286, 'now'), (286, 'here'),
(287, 'years'), (287, 'day'), (287, 'month'), (287, 'week'), (287, 'hour'), (287, 'minute'), (287, 'second'), (287, 'time'), (287, 'now'), (287, 'here'),
(288, 'years'), (288, 'day'), (288, 'month'), (288, 'week'), (288, 'hour'), (288, 'minute'), (288, 'second'), (288, 'time'), (288, 'now'), (288, 'here');

-- =============================================================================
-- WORD 37: him (ID: 37, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (37, 'him', 'هو (مفعول به) / ـه', 'pron.', 'Used as the object of a verb or preposition to refer to a male person.', 'يستخدم كمفعول به لفعل أو حرف جر للإشارة إلى ذكر.', 'هو (مفعول به) / ـه', '["إياه"]', '{"object": "him"}', '/hɪm/', 'him.mp3', '{"synonyms": [], "antonyms": ["her"], "word_family": ["he", "his", "himself"]}', 'The object form of the pronoun "he".', 'Beginner', 65);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(37, 'I saw {him} at the park.', 'رأيته في الحديقة.', 'him', 'Social', 'Easy', 1, 1),
(37, 'Give it to {him}.', 'أعطها إياه.', 'him', 'Giving', 'Easy', 0, 2),
(37, 'Tell {him} the truth.', 'قل له الحقيقة.', 'him', 'Communication', 'Easy', 0, 3),
(37, 'I live with {him}.', 'أنا أعيش معه.', 'him', 'Social', 'Easy', 0, 4),
(37, 'Call {him} now.', 'اتصل به الآن.', 'him', 'Communication', 'Easy', 0, 5),
(37, 'Look at {him}.', 'انظر إليه.', 'him', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(37, 'translation_match', 'easy', 'him', 'en', 'هو (مفعول به) / ـه', 'object', NULL, NULL, NULL, '"him" is the object pronoun for a male.'),
(37, 'reverse_translation', 'easy', 'هو (مفعول به) / ـه', 'ar', 'him', 'object', NULL, NULL, NULL, 'The Arabic suffix "ـه" translates to "him".'),
(37, 'sentence_completion', 'easy', 'I know ___ very well.', 'en', 'him', 'object', 'I know ___ very well.', 'I know him very well.', 2, 'Use "him" as the object of the verb "know".'),
(37, 'sentence_completion', 'easy', 'Please help ___.', 'en', 'him', 'object', 'Please help ___.', 'Please help him.', 2, 'Use "him" as the object of the verb "help".'),
(37, 'sentence_completion', 'easy', 'I bought a gift for ___.', 'en', 'him', 'object', 'I bought a gift for ___.', 'I bought a gift for him.', 4, 'Use "him" after the preposition "for".'),
(37, 'sentence_completion', 'easy', 'Wait for ___!', 'en', 'him', 'object', 'Wait for ___!', 'Wait for him!', 2, 'Use "him" after the preposition "for".'),
(37, 'sentence_completion', 'easy', 'Did you see ___?', 'en', 'him', 'object', 'Did you see ___?', 'Did you see him?', 3, 'Use "him" as the object in a question.'),
(37, 'sentence_completion', 'easy', 'Talk to ___ later.', 'en', 'him', 'object', 'Talk to ___ later.', 'Talk to him later.', 2, 'Use "him" after the preposition "to".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(289, 'هي'), (289, 'أنا'), (289, 'نحن'), (289, 'هم'), (289, 'أنت'), (289, 'إياها'), (289, 'إياي'), (289, 'إيانا'), (289, 'إياهم'), (289, 'إياك'),
(290, 'her'), (290, 'me'), (290, 'us'), (290, 'them'), (290, 'you'), (290, 'it'), (290, 'he'), (290, 'she'), (290, 'his'), (290, 'my'),
(291, 'he'), (291, 'his'), (291, 'himself'), (291, 'her'), (291, 'me'), (291, 'us'), (291, 'them'), (291, 'you'), (291, 'it'), (291, 'she'),
(292, 'he'), (292, 'his'), (292, 'himself'), (292, 'her'), (292, 'me'), (292, 'us'), (292, 'them'), (292, 'you'), (292, 'it'), (292, 'she'),
(293, 'he'), (293, 'his'), (293, 'himself'), (293, 'her'), (293, 'me'), (293, 'us'), (293, 'them'), (293, 'you'), (293, 'it'), (293, 'she'),
(294, 'he'), (294, 'his'), (294, 'himself'), (294, 'her'), (294, 'me'), (294, 'us'), (294, 'them'), (294, 'you'), (294, 'it'), (294, 'she'),
(295, 'he'), (295, 'his'), (295, 'himself'), (295, 'her'), (295, 'me'), (295, 'us'), (295, 'them'), (295, 'you'), (295, 'it'), (295, 'she'),
(296, 'he'), (296, 'his'), (296, 'himself'), (296, 'her'), (296, 'me'), (296, 'us'), (296, 'them'), (296, 'you'), (296, 'it'), (296, 'she');

-- =============================================================================
-- WORD 38: them (ID: 38, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (38, 'them', 'هم (مفعول به) / ـهم', 'pron.', 'Used as the object of a verb or preposition to refer to two or more people or things.', 'يستخدم كمفعول به لفعل أو حرف جر للإشارة إلى شخصين أو أكثر أو أشياء.', 'هم (مفعول به) / ـهم', '["إياهم"]', '{"object": "them"}', '/ðɛm/', 'them.mp3', '{"synonyms": [], "antonyms": [], "word_family": ["they", "their", "theirs", "themselves"]}', 'The object form of the pronoun "they".', 'Beginner', 66);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(38, 'I saw {them} at the park.', 'رأيتهم في الحديقة.', 'them', 'Social', 'Easy', 1, 1),
(38, 'Give the books to {them}.', 'أعطِ الكتب لهم.', 'them', 'Giving', 'Easy', 0, 2),
(38, 'I like {them} very much.', 'أنا أحبهم كثيراً.', 'them', 'Emotion', 'Easy', 0, 3),
(38, 'Tell {them} the news.', 'أخبرهم بالأخبار.', 'them', 'Communication', 'Easy', 0, 4),
(38, 'I am going with {them}.', 'أنا ذاهب معهم.', 'them', 'Social', 'Easy', 0, 5),
(38, 'Look at {them}!', 'انظر إليهم!', 'them', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(38, 'translation_match', 'easy', 'them', 'en', 'هم (مفعول به) / ـهم', 'object', NULL, NULL, NULL, '"them" is the object pronoun for a group of people or things.'),
(38, 'reverse_translation', 'easy', 'هم (مفعول به) / ـهم', 'ar', 'them', 'object', NULL, NULL, NULL, 'The Arabic suffix "ـهم" translates to "them" in English.'),
(38, 'sentence_completion', 'easy', 'I know ___ well.', 'en', 'them', 'object', 'I know ___ well.', 'I know them well.', 2, 'Use "them" as the object of the verb "know".'),
(38, 'sentence_completion', 'easy', 'Please help ___.', 'en', 'them', 'object', 'Please help ___.', 'Please help them.', 2, 'Use "them" as the object of the verb "help".'),
(38, 'sentence_completion', 'easy', 'I bought a gift for ___.', 'en', 'them', 'object', 'I bought a gift for ___.', 'I bought a gift for them.', 4, 'Use "them" after the preposition "for".'),
(38, 'sentence_completion', 'easy', 'Wait for ___!', 'en', 'them', 'object', 'Wait for ___!', 'Wait for them!', 2, 'Use "them" after the preposition "for".'),
(38, 'sentence_completion', 'easy', 'Did you see ___?', 'en', 'them', 'object', 'Did you see ___?', 'Did you see them?', 3, 'Use "them" as the object in a question.'),
(38, 'sentence_completion', 'easy', 'Talk to ___ later.', 'en', 'them', 'object', 'Talk to ___ later.', 'Talk to them later.', 2, 'Use "them" after the preposition "to".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(297, 'هو'), (297, 'هي'), (297, 'أنا'), (297, 'نحن'), (297, 'أنت'), (297, 'إياه'), (297, 'إياها'), (297, 'إياي'), (297, 'إيانا'), (297, 'إياك'),
(298, 'they'), (298, 'their'), (298, 'theirs'), (298, 'themselves'), (298, 'him'), (298, 'her'), (298, 'me'), (298, 'us'), (298, 'you'), (298, 'it'),
(299, 'they'), (299, 'their'), (299, 'theirs'), (299, 'themselves'), (299, 'him'), (299, 'her'), (299, 'me'), (299, 'us'), (299, 'you'), (299, 'it'),
(300, 'they'), (300, 'their'), (300, 'theirs'), (300, 'themselves'), (300, 'him'), (300, 'her'), (300, 'me'), (300, 'us'), (300, 'you'), (300, 'it'),
(301, 'they'), (301, 'their'), (301, 'theirs'), (301, 'themselves'), (301, 'him'), (301, 'her'), (301, 'me'), (301, 'us'), (301, 'you'), (301, 'it'),
(302, 'they'), (302, 'their'), (302, 'theirs'), (302, 'themselves'), (302, 'him'), (302, 'her'), (302, 'me'), (302, 'us'), (302, 'you'), (302, 'it'),
(303, 'they'), (303, 'their'), (303, 'theirs'), (303, 'themselves'), (303, 'him'), (303, 'her'), (303, 'me'), (303, 'us'), (303, 'you'), (303, 'it'),
(304, 'they'), (304, 'their'), (304, 'theirs'), (304, 'themselves'), (304, 'him'), (304, 'her'), (304, 'me'), (304, 'us'), (304, 'you'), (304, 'it');

-- =============================================================================
-- WORD 39: some (ID: 39, POS: det., pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (39, 'some', 'بعض', 'det., pron.', 'An unspecified amount or number of.', 'كمية أو عدد غير محدد من.', 'بعض', '["قليل من"]', '{"base": "some"}', '/sʌm/', 'some.mp3', '{"synonyms": ["a few", "a bit of"], "antonyms": ["none", "all"], "word_family": ["someone", "something"]}', 'Used in positive sentences and offers/requests.', 'Beginner', 67);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(39, 'I need {some} water.', 'أحتاج إلى بعض الماء.', 'some', 'Needs', 'Easy', 1, 1),
(39, 'There are {some} books on the table.', 'هناك بعض الكتب على الطاولة.', 'some', 'General', 'Easy', 0, 2),
(39, 'Would you like {some} coffee?', 'هل تود بعض القهوة؟', 'some', 'Social', 'Easy', 0, 3),
(39, 'I have {some} friends in London.', 'لي بعض الأصدقاء في لندن.', 'some', 'Social', 'Easy', 0, 4),
(39, '{Some} people like winter.', 'بعض الناس يحبون الشتاء.', 'some', 'General', 'Easy', 0, 5),
(39, 'Can I have {some} help?', 'هل يمكنني الحصول على بعض المساعدة؟', 'some', 'Requests', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(39, 'translation_match', 'easy', 'some', 'en', 'بعض', 'base', NULL, NULL, NULL, '"some" indicates an unspecified quantity.'),
(39, 'reverse_translation', 'easy', 'بعض', 'ar', 'some', 'base', NULL, NULL, NULL, 'The Arabic "بعض" translates to "some".'),
(39, 'sentence_completion', 'easy', 'I bought ___ apples.', 'en', 'some', 'base', 'I bought ___ apples.', 'I bought some apples.', 2, 'Use "some" for an unspecified number of items.'),
(39, 'sentence_completion', 'easy', 'Give me ___ time.', 'en', 'some', 'base', 'Give me ___ time.', 'Give me some time.', 2, 'Use "some" with uncountable nouns like "time".'),
(39, 'sentence_completion', 'easy', '___ students are late.', 'en', 'Some', 'base', '___ students are late.', 'Some students are late.', 0, 'Use "Some" to refer to a part of a group.'),
(39, 'sentence_completion', 'easy', 'Would you like ___ tea?', 'en', 'some', 'base', 'Would you like ___ tea?', 'Would you like some tea.', 3, 'Use "some" when making an offer.'),
(39, 'sentence_completion', 'easy', 'I have ___ money.', 'en', 'some', 'base', 'I have ___ money.', 'I have some money.', 2, 'Use "some" to indicate a positive amount.'),
(39, 'sentence_completion', 'easy', 'There is ___ milk left.', 'en', 'some', 'base', 'There is ___ milk left.', 'There is some milk left.', 2, 'Use "some" to show existence of a quantity.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(305, 'كل'), (305, 'لا شيء'), (305, 'واحد'), (305, 'كثير'), (305, 'قليل'), (305, 'أي'), (305, 'نفس'), (305, 'آخر'), (305, 'هنا'), (305, 'هناك'),
(306, 'any'), (306, 'no'), (306, 'all'), (306, 'none'), (306, 'every'), (306, 'each'), (306, 'many'), (306, 'much'), (306, 'few'), (306, 'little'),
(307, 'any'), (307, 'no'), (307, 'all'), (307, 'none'), (307, 'many'), (307, 'much'), (307, 'few'), (307, 'little'), (307, 'every'), (307, 'each'),
(308, 'any'), (308, 'no'), (308, 'all'), (308, 'none'), (308, 'many'), (308, 'much'), (308, 'few'), (308, 'little'), (308, 'every'), (308, 'each'),
(309, 'Any'), (309, 'No'), (309, 'All'), (309, 'None'), (309, 'Every'), (309, 'Each'), (309, 'Many'), (309, 'Much'), (309, 'Few'), (309, 'Little'),
(310, 'any'), (310, 'no'), (310, 'all'), (310, 'none'), (310, 'every'), (310, 'each'), (310, 'many'), (310, 'much'), (310, 'few'), (310, 'little'),
(311, 'any'), (311, 'no'), (311, 'all'), (311, 'none'), (311, 'many'), (311, 'much'), (311, 'few'), (311, 'little'), (311, 'every'), (311, 'each'),
(312, 'any'), (312, 'no'), (312, 'all'), (312, 'none'), (312, 'every'), (312, 'each'), (312, 'many'), (312, 'much'), (312, 'few'), (312, 'little');

-- =============================================================================
-- WORD 40: want (ID: 40, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (40, 'want', 'يريد', 'v.', 'To have a desire to possess or do something.', 'أن يكون لديك رغبة في امتلاك أو فعل شيء ما.', 'يريد', '["يرغب"]', '{"base": "want", "thirdPerson": "wants", "past": "wanted", "gerund": "wanting"}', '/wɒnt/', 'want.mp3', '{"synonyms": ["desire", "wish"], "antonyms": ["dislike"], "word_family": []}', 'Commonly followed by a noun or "to" + verb.', 'Beginner', 68);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(40, 'I {want} some water.', 'أريد بعض الماء.', 'want', 'Needs', 'Easy', 1, 1),
(40, 'She {wants} to go home.', 'هي تريد الذهاب إلى المنزل.', 'wants', 'Needs', 'Easy', 0, 2),
(40, 'He {wanted} a new bike.', 'أراد دراجة جديدة.', 'wanted', 'Possession', 'Easy', 0, 3),
(40, 'Do you {want} to play?', 'هل تريد أن تلعب؟', 'want', 'Social', 'Easy', 0, 4),
(40, 'They {want} to help us.', 'هم يريدون مساعدتنا.', 'want', 'Support', 'Easy', 0, 5),
(40, 'I {want} to be a doctor.', 'أريد أن أكون طبيباً.', 'want', 'Career', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(40, 'translation_match', 'easy', 'want', 'en', 'يريد', 'base', NULL, NULL, NULL, '"want" is the base verb for expressing desire.'),
(40, 'reverse_translation', 'easy', 'يريد', 'ar', 'want', 'base', NULL, NULL, NULL, 'The Arabic verb "يريد" translates to "want".'),
(40, 'sentence_completion', 'easy', 'I ___ to sleep.', 'en', 'want', 'base', 'I ___ to sleep.', 'I want to sleep.', 1, 'Use the base form "want" with the pronoun "I".'),
(40, 'sentence_completion', 'easy', 'He ___ a cup of tea.', 'en', 'wants', 'thirdPerson', 'He ___ a cup of tea.', 'He wants a cup of tea.', 1, 'Use "wants" for third-person singular present.'),
(40, 'sentence_completion', 'easy', 'Yesterday, she ___ to stay.', 'en', 'wanted', 'past', 'Yesterday, she ___ to stay.', 'Yesterday, she wanted to stay.', 2, 'Use "wanted" for the past tense of "want".'),
(40, 'sentence_completion', 'easy', 'They ___ to see the movie.', 'en', 'want', 'base', 'They ___ to see the movie.', 'They want to see the movie.', 1, 'Use "want" for plural subjects.'),
(40, 'sentence_completion', 'easy', 'Do you ___ anything else?', 'en', 'want', 'base', 'Do you ___ anything else?', 'Do you want anything else?', 2, 'Use the base form "want" in a question with "do".'),
(40, 'sentence_completion', 'easy', 'I ___ to tell you something.', 'en', 'want', 'base', 'I ___ to tell you something.', 'I want to tell you something.', 1, 'Use "want" to express an intention.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(313, 'يأكل'), (313, 'ينام'), (313, 'يرى'), (313, 'يذهب'), (313, 'يأخذ'), (313, 'يعطي'), (313, 'يقول'), (313, 'يفعل'), (313, 'يصنع'), (313, 'يحصل'),
(314, 'eat'), (314, 'sleep'), (314, 'see'), (314, 'go'), (314, 'take'), (314, 'give'), (314, 'say'), (314, 'do'), (314, 'make'), (314, 'get'),
(315, 'wants'), (315, 'wanted'), (315, 'wanting'), (315, 'eats'), (315, 'sees'), (315, 'goes'), (315, 'takes'), (315, 'gives'), (315, 'says'), (315, 'makes'),
(316, 'want'), (316, 'wanted'), (316, 'wanting'), (316, 'eat'), (316, 'see'), (316, 'go'), (316, 'take'), (316, 'give'), (316, 'say'), (316, 'make'),
(317, 'want'), (317, 'wants'), (317, 'wanting'), (317, 'eat'), (317, 'see'), (317, 'go'), (317, 'take'), (317, 'give'), (317, 'say'), (317, 'make'),
(318, 'wants'), (318, 'wanted'), (318, 'wanting'), (318, 'eat'), (318, 'see'), (318, 'go'), (318, 'take'), (318, 'give'), (318, 'say'), (318, 'make'),
(319, 'wants'), (319, 'wanted'), (319, 'wanting'), (319, 'eat'), (319, 'see'), (319, 'go'), (319, 'take'), (319, 'give'), (319, 'say'), (319, 'make'),
(320, 'wants'), (320, 'wanted'), (320, 'wanting'), (320, 'eat'), (320, 'see'), (320, 'go'), (320, 'take'), (320, 'give'), (320, 'say'), (320, 'make');

-- =============================================================================
-- WORD 41: how (ID: 41, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (41, 'how', 'كيف', 'adv.', 'In what way or manner; by what means.', 'بأي طريقة أو أسلوب؛ بأي وسيلة.', 'كيف', '["كم"]', '{"base": "how"}', '/haʊ/', 'how.mp3', '{"synonyms": ["in what way"], "antonyms": [], "word_family": ["however", "somehow"]}', 'Used to ask about manner, condition, or degree.', 'Beginner', 69);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(41, '{How} are you?', 'كيف حالك؟', 'how', 'Social', 'Easy', 1, 1),
(41, '{How} much is this?', 'بكم هذا؟', 'how', 'Shopping', 'Easy', 0, 2),
(41, 'I know {how} to cook.', 'أعرف كيف أطبخ.', 'how', 'Skills', 'Easy', 0, 3),
(41, '{How} was your day?', 'كيف كان يومك؟', 'how', 'Social', 'Easy', 0, 4),
(41, '{How} many people are there?', 'كم عدد الأشخاص هناك؟', 'how', 'Quantity', 'Easy', 0, 5),
(41, 'Tell me {how} it works.', 'أخبرني كيف يعمل.', 'how', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(41, 'translation_match', 'easy', 'how', 'en', 'كيف', 'base', NULL, NULL, NULL, '"how" is used to ask about the manner or state of something.'),
(41, 'reverse_translation', 'easy', 'كيف', 'ar', 'how', 'base', NULL, NULL, NULL, 'The Arabic "كيف" translates to "how" in English.'),
(41, 'sentence_completion', 'easy', '___ old are you?', 'en', 'How', 'base', '___ old are you?', 'How old are you?', 0, 'Use "How" to ask about age.'),
(41, 'sentence_completion', 'easy', '___ do you go to school?', 'en', 'How', 'base', '___ do you go to school?', 'How do you go to school?', 0, 'Use "How" to ask about the means of transport.'),
(41, 'sentence_completion', 'easy', '___ far is the station?', 'en', 'How', 'base', '___ far is the station?', 'How far is the station?', 0, 'Use "How" to ask about distance.'),
(41, 'sentence_completion', 'easy', '___ can I help you?', 'en', 'How', 'base', '___ can I help you?', 'How can I help you?', 0, 'Use "How" to offer assistance.'),
(41, 'sentence_completion', 'easy', 'I don''t know ___ to swim.', 'en', 'how', 'base', 'I don''t know ___ to swim.', 'I don''t know how to swim.', 3, 'Use "how" to indicate a skill or method.'),
(41, 'sentence_completion', 'easy', '___ often do you exercise?', 'en', 'How', 'base', '___ often do you exercise?', 'How often do you exercise?', 0, 'Use "How" to ask about frequency.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(321, 'ماذا'), (321, 'متى'), (321, 'أين'), (321, 'لماذا'), (321, 'من'), (321, 'أي'), (321, 'كم'), (321, 'هل'), (321, 'الذي'), (321, 'هذا'),
(322, 'what'), (322, 'when'), (322, 'where'), (322, 'why'), (322, 'who'), (322, 'which'), (322, 'how many'), (322, 'whose'), (322, 'that'), (322, 'this'),
(323, 'What'), (323, 'When'), (323, 'Where'), (323, 'Why'), (323, 'Who'), (323, 'Which'), (323, 'That'), (323, 'This'), (323, 'It'), (323, 'Whose'),
(324, 'What'), (324, 'When'), (324, 'Where'), (324, 'Why'), (324, 'Who'), (324, 'Which'), (324, 'That'), (324, 'This'), (324, 'It'), (324, 'Whose'),
(325, 'What'), (325, 'When'), (325, 'Where'), (325, 'Why'), (325, 'Who'), (325, 'Which'), (325, 'That'), (325, 'This'), (325, 'It'), (325, 'Whose'),
(326, 'What'), (326, 'When'), (326, 'Where'), (326, 'Why'), (326, 'Who'), (326, 'Which'), (326, 'That'), (326, 'This'), (326, 'It'), (326, 'Whose'),
(327, 'what'), (327, 'when'), (327, 'where'), (327, 'why'), (327, 'who'), (327, 'which'), (327, 'that'), (327, 'this'), (327, 'it'), (327, 'whose'),
(328, 'What'), (328, 'When'), (328, 'Where'), (328, 'Why'), (328, 'Who'), (328, 'Which'), (328, 'That'), (328, 'This'), (328, 'It'), (328, 'Whose');

-- =============================================================================
-- WORD 42: which (ID: 42, POS: pron./det.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (42, 'which', 'أي', 'pron./det.', 'Asking for information specifying one or more people or things from a definite set.', 'طلب معلومات تحدد شخصاً أو شيئاً أو أكثر من مجموعة محددة.', 'أي', '["الذي"]', '{"base": "which"}', '/wɪtʃ/', 'which.mp3', '{"synonyms": ["what"], "antonyms": [], "word_family": ["whichever"]}', 'Used when there is a limited number of choices.', 'Beginner', 71);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(42, '{Which} color do you prefer?', 'أي لون تفضل؟', 'which', 'Choices', 'Easy', 1, 1),
(42, '{Which} one is yours?', 'أي واحد هو لك؟', 'which', 'Possession', 'Easy', 0, 2),
(42, 'I don''t know {which} way to go.', 'لا أعرف أي طريق أسلك.', 'which', 'Direction', 'Easy', 0, 3),
(42, 'The book, {which} I read, was good.', 'الكتاب، الذي قرأته، كان جيداً.', 'which', 'Education', 'Easy', 0, 4),
(42, '{Which} of these is better?', 'أي من هذه أفضل؟', 'which', 'Comparison', 'Easy', 0, 5),
(42, 'Tell me {which} you want.', 'أخبرني أيهما تريد.', 'which', 'Preferences', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(42, 'translation_match', 'easy', 'which', 'en', 'أي', 'base', NULL, NULL, NULL, '"which" is used to ask for a choice among a limited set.'),
(42, 'reverse_translation', 'easy', 'أي', 'ar', 'which', 'base', NULL, NULL, NULL, 'The Arabic "أي" translates to "which" in English.'),
(42, 'sentence_completion', 'easy', '___ bus goes to the city?', 'en', 'Which', 'base', '___ bus goes to the city?', 'Which bus goes to the city?', 0, 'Use "Which" to ask about a specific choice from a group of buses.'),
(42, 'sentence_completion', 'easy', '___ of you is John?', 'en', 'Which', 'base', '___ of you is John?', 'Which of you is John?', 0, 'Use "Which" to identify a specific person from a group.'),
(42, 'sentence_completion', 'easy', 'I like the blue one, ___ is cheaper.', 'en', 'which', 'base', 'I like the blue one, ___ is cheaper.', 'I like the blue one, which is cheaper.', 5, 'Use "which" as a relative pronoun for things.'),
(42, 'sentence_completion', 'easy', '___ way is the station?', 'en', 'Which', 'base', '___ way is the station?', 'Which way is the station?', 0, 'Use "Which" to ask for a specific direction.'),
(42, 'sentence_completion', 'easy', '___ do you want, tea or coffee?', 'en', 'Which', 'base', '___ do you want, tea or coffee?', 'Which do you want, tea or coffee?', 0, 'Use "Which" when offering a specific set of choices.'),
(42, 'sentence_completion', 'easy', 'He forgot ___ key was his.', 'en', 'which', 'base', 'He forgot ___ key was his.', 'He forgot which key was his.', 2, 'Use "which" to indicate a choice between specific items.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(329, 'من'), (329, 'ماذا'), (329, 'متى'), (329, 'أين'), (329, 'لماذا'), (329, 'كيف'), (329, 'كم'), (329, 'هل'), (329, 'الذي'), (329, 'هذا'),
(330, 'who'), (330, 'what'), (330, 'when'), (330, 'where'), (330, 'why'), (330, 'how'), (330, 'whose'), (330, 'whom'), (330, 'that'), (330, 'this'),
(331, 'Who'), (331, 'What'), (331, 'When'), (331, 'Where'), (331, 'Why'), (331, 'How'), (331, 'Whose'), (331, 'Whom'), (331, 'That'), (331, 'This'),
(332, 'Who'), (332, 'What'), (332, 'When'), (332, 'Where'), (332, 'Why'), (332, 'How'), (332, 'Whose'), (332, 'Whom'), (332, 'That'), (332, 'This'),
(333, 'who'), (333, 'what'), (333, 'when'), (333, 'where'), (333, 'why'), (333, 'how'), (333, 'whose'), (333, 'whom'), (333, 'that'), (333, 'this'),
(334, 'Who'), (334, 'What'), (334, 'When'), (334, 'Where'), (334, 'Why'), (334, 'How'), (334, 'Whose'), (334, 'Whom'), (334, 'That'), (334, 'This'),
(335, 'Who'), (335, 'What'), (335, 'When'), (335, 'Where'), (335, 'Why'), (335, 'How'), (335, 'Whose'), (335, 'Whom'), (335, 'That'), (335, 'This'),
(336, 'who'), (336, 'what'), (336, 'when'), (336, 'where'), (336, 'why'), (336, 'how'), (336, 'whose'), (336, 'whom'), (336, 'that'), (336, 'this');

-- =============================================================================
-- WORD 43: could (ID: 43, POS: modal v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (43, 'could', 'استطاع / يمكن', 'modal v.', 'Used to indicate past ability or to make a polite request.', 'يستخدم للإشارة إلى القدرة في الماضي أو لتقديم طلب مهذب.', 'استطاع / يمكن', '["قد"]', '{"base": "could", "negative": "couldn''t"}', '/kʊd/', 'could.mp3', '{"synonyms": ["was able to"], "antonyms": [], "word_family": ["can", "ability"]}', 'The past tense of "can"; also used for possibility.', 'Beginner', 75);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(43, 'I {could} swim when I was five.', 'كنت أستطيع السباحة عندما كنت في الخامسة.', 'could', 'Ability', 'Easy', 1, 1),
(43, '{Could} you help me, please?', 'هل يمكنك مساعدتي، من فضلك؟', 'could', 'Requests', 'Easy', 0, 2),
(43, 'It {could} rain today.', 'قد تمطر اليوم.', 'could', 'Possibility', 'Easy', 0, 3),
(43, 'He {couldn''t} come to the party.', 'لم يستطع المجيء إلى الحفلة.', 'couldn''t', 'Past Events', 'Easy', 0, 4),
(43, 'I wish I {could} go.', 'أتمنى لو استطعت الذهاب.', 'could', 'Emotion', 'Easy', 0, 5),
(43, 'She {could} speak French well.', 'كانت تستطيع التحدث بالفرنسية جيداً.', 'could', 'Ability', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(43, 'translation_match', 'easy', 'could', 'en', 'استطاع / يمكن', 'base', NULL, NULL, NULL, '"could" is the past tense of "can" or a polite request form.'),
(43, 'reverse_translation', 'easy', 'استطاع', 'ar', 'could', 'base', NULL, NULL, NULL, 'The Arabic "استطاع" translates to "could" in a past context.'),
(43, 'sentence_completion', 'easy', '___ you open the door?', 'en', 'Could', 'base', '___ you open the door?', 'Could you open the door?', 0, 'Use "Could" for a polite request.'),
(43, 'sentence_completion', 'easy', 'I ___ not find my keys.', 'en', 'could', 'base', 'I ___ not find my keys.', 'I could not find my keys.', 1, 'Use "could" for past inability.'),
(43, 'sentence_completion', 'easy', 'He ___ run fast when he was young.', 'en', 'could', 'base', 'He ___ run fast when he was young.', 'He could run fast when he was young.', 1, 'Use "could" for general ability in the past.'),
(43, 'sentence_completion', 'easy', 'We ___ go to the beach if you want.', 'en', 'could', 'base', 'We ___ go to the beach if you want.', 'We could go to the beach if you want.', 1, 'Use "could" to suggest a possibility.'),
(43, 'sentence_completion', 'easy', 'She ___ come because she was sick.', 'en', 'couldn''t', 'negative', 'She ___ come because she was sick.', 'She couldn''t come because she was sick.', 1, 'Use "couldn''t" for past negative ability.'),
(43, 'sentence_completion', 'easy', '___ I use your phone?', 'en', 'Could', 'base', '___ I use your phone?', 'Could I use your phone?', 0, 'Use "Could" to ask for permission politely.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(337, 'يجب'), (337, 'سوف'), (337, 'يريد'), (337, 'يفعل'), (337, 'يذهب'), (337, 'يأكل'), (337, 'ينام'), (337, 'يرى'), (337, 'يأخذ'), (337, 'يعطي'),
(338, 'can'), (338, 'will'), (338, 'must'), (338, 'should'), (338, 'would'), (338, 'might'), (338, 'may'), (338, 'shall'), (338, 'do'), (338, 'did'),
(339, 'Can'), (339, 'Will'), (339, 'Must'), (339, 'Should'), (339, 'Would'), (339, 'Might'), (339, 'May'), (339, 'Shall'), (339, 'Do'), (339, 'Did'),
(340, 'can'), (340, 'will'), (340, 'must'), (340, 'should'), (340, 'would'), (340, 'might'), (340, 'may'), (340, 'shall'), (340, 'do'), (340, 'did'),
(341, 'can'), (341, 'will'), (341, 'must'), (341, 'should'), (341, 'would'), (341, 'might'), (341, 'may'), (341, 'shall'), (341, 'do'), (341, 'did'),
(342, 'can'), (342, 'will'), (342, 'must'), (342, 'should'), (342, 'would'), (342, 'might'), (342, 'may'), (342, 'shall'), (342, 'do'), (342, 'did'),
(343, 'can'), (343, 'will'), (343, 'must'), (343, 'should'), (343, 'would'), (343, 'might'), (343, 'may'), (343, 'shall'), (343, 'do'), (343, 'did'),
(344, 'Can'), (344, 'Will'), (344, 'Must'), (344, 'Should'), (344, 'Would'), (344, 'Might'), (344, 'May'), (344, 'Shall'), (344, 'Do'), (344, 'Did');

-- =============================================================================
-- WORD 44: our (ID: 44, POS: det.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (44, 'our', 'لنا / ـنا', 'det.', 'Belonging to or associated with the speaker and one or more other people.', 'ينتمي إلى أو يرتبط بالمتحدث وشخص آخر أو أكثر.', 'لنا / ـنا', '["خاصتنا"]', '{"determiner": "our"}', '/ˈaʊər/', 'our.mp3', '{"synonyms": [], "antonyms": ["their"], "word_family": ["ours", "ourselves"]}', 'Possessive determiner used before a noun.', 'Beginner', 76);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(44, 'This is {our} house.', 'هذا منزلنا.', 'our', 'Home', 'Easy', 1, 1),
(44, '{Our} car is blue.', 'سيارتنا زرقاء.', 'our', 'Possession', 'Easy', 0, 2),
(44, 'We love {our} family.', 'نحن نحب عائلتنا.', 'our', 'Family', 'Easy', 0, 3),
(44, '{Our} school is very big.', 'مدرستنا كبيرة جداً.', 'our', 'Education', 'Easy', 0, 4),
(44, 'Welcome to {our} city.', 'مرحباً بكم في مدينتنا.', 'our', 'Social', 'Easy', 0, 5),
(44, '{Our} team won the game.', 'فريقنا فاز بالمباراة.', 'our', 'Sports', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(44, 'translation_match', 'easy', 'our', 'en', 'لنا / ـنا', 'determiner', NULL, NULL, NULL, '"our" is the possessive form for "we".'),
(44, 'reverse_translation', 'easy', 'لنا', 'ar', 'our', 'determiner', NULL, NULL, NULL, 'The Arabic suffix "ـنا" translates to "our" in English.'),
(44, 'sentence_completion', 'easy', '___ teacher is very nice.', 'en', 'Our', 'determiner', '___ teacher is very nice.', 'Our teacher is very nice.', 0, 'Use "Our" to show possession by a group including the speaker.'),
(44, 'sentence_completion', 'easy', 'We need to clean ___ room.', 'en', 'our', 'determiner', 'We need to clean ___ room.', 'We need to clean our room.', 4, 'Use "our" before the noun "room".'),
(44, 'sentence_completion', 'easy', 'This is ___ favorite restaurant.', 'en', 'our', 'determiner', 'This is ___ favorite restaurant.', 'This is our favorite restaurant.', 2, 'Use "our" to show a shared preference.'),
(44, 'sentence_completion', 'easy', '___ dog is barking.', 'en', 'Our', 'determiner', '___ dog is barking.', 'Our dog is barking.', 0, 'Use "Our" to refer to a pet belonging to the group.'),
(44, 'sentence_completion', 'easy', 'We are proud of ___ work.', 'en', 'our', 'determiner', 'We are proud of ___ work.', 'We are proud of our work.', 4, 'Use "our" to refer to the group''s achievement.'),
(44, 'sentence_completion', 'easy', '___ flight is at noon.', 'en', 'Our', 'determiner', '___ flight is at noon.', 'Our flight is at noon.', 0, 'Use "Our" to refer to a shared travel schedule.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(345, 'لي'), (345, 'لك'), (345, 'له'), (345, 'لها'), (345, 'لهم'), (345, 'أنا'), (345, 'نحن'), (345, 'هو'), (345, 'هي'), (345, 'هم'),
(346, 'my'), (346, 'your'), (346, 'his'), (346, 'her'), (346, 'their'), (346, 'its'), (346, 'me'), (346, 'us'), (346, 'we'), (346, 'ours'),
(347, 'My'), (347, 'Your'), (347, 'His'), (347, 'Her'), (347, 'Their'), (347, 'Its'), (347, 'Me'), (347, 'Us'), (347, 'We'), (347, 'Ours'),
(348, 'my'), (348, 'your'), (348, 'his'), (348, 'her'), (348, 'their'), (348, 'its'), (348, 'me'), (348, 'us'), (348, 'we'), (348, 'ours'),
(349, 'my'), (349, 'your'), (349, 'his'), (349, 'her'), (349, 'their'), (349, 'its'), (349, 'me'), (349, 'us'), (349, 'we'), (349, 'ours'),
(350, 'My'), (350, 'Your'), (350, 'His'), (350, 'Her'), (350, 'Their'), (350, 'Its'), (350, 'Me'), (350, 'Us'), (350, 'We'), (350, 'Ours'),
(351, 'my'), (351, 'your'), (351, 'his'), (351, 'her'), (351, 'their'), (351, 'its'), (351, 'me'), (351, 'us'), (351, 'we'), (351, 'ours'),
(352, 'My'), (352, 'Your'), (352, 'His'), (352, 'Her'), (352, 'Their'), (352, 'Its'), (352, 'Me'), (352, 'Us'), (352, 'We'), (352, 'Ours');

-- =============================================================================
-- WORD 45: into (ID: 45, POS: prep.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (45, 'into', 'إلى الداخل', 'prep.', 'Expressing movement or action with the result that someone or something becomes enclosed or surrounded.', 'التعبير عن حركة أو فعل يؤدي إلى أن يصبح شخص ما أو شيء ما محاطاً بشيء آخر.', 'إلى الداخل', '["في", "إلى"]', '{"base": "into"}', '/ˈɪntuː/', 'into.mp3', '{"synonyms": ["inside", "to"], "antonyms": ["out of"], "word_family": []}', 'Used to show movement towards the inside of something.', 'Beginner', 77);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(45, 'Walk {into} the room.', 'ادخل إلى الغرفة.', 'into', 'Movement', 'Easy', 1, 1),
(45, 'Put the keys {into} the box.', 'ضع المفاتيح في الصندوق.', 'into', 'Instruction', 'Easy', 0, 2),
(45, 'Ice turns {into} water.', 'يتحول الجليد إلى ماء.', 'into', 'Change', 'Easy', 0, 3),
(45, 'Look {into} my eyes.', 'انظر في عيني.', 'into', 'General', 'Easy', 0, 4),
(45, 'He went {into} the house.', 'دخل إلى المنزل.', 'into', 'Movement', 'Easy', 0, 5),
(45, 'Don''t fall {into} the trap.', 'لا تقع في الفخ.', 'into', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(45, 'translation_match', 'easy', 'into', 'en', 'إلى الداخل', 'base', NULL, NULL, NULL, '"into" indicates movement towards the inside of a place or object.'),
(45, 'reverse_translation', 'easy', 'إلى الداخل', 'ar', 'into', 'base', NULL, NULL, NULL, 'The Arabic "إلى الداخل" translates to "into" in English.'),
(45, 'sentence_completion', 'easy', 'Come ___ the house.', 'en', 'into', 'base', 'Come ___ the house.', 'Come into the house.', 1, 'Use "into" to show movement from outside to inside.'),
(45, 'sentence_completion', 'easy', 'She poured the milk ___ the glass.', 'en', 'into', 'base', 'She poured the milk ___ the glass.', 'She poured the milk into the glass.', 4, 'Use "into" for liquids being put inside a container.'),
(45, 'sentence_completion', 'easy', 'The caterpillar changed ___ a butterfly.', 'en', 'into', 'base', 'The caterpillar changed ___ a butterfly.', 'The caterpillar changed into a butterfly.', 3, 'Use "into" to show a transformation or change.'),
(45, 'sentence_completion', 'easy', 'He ran ___ the wall.', 'en', 'into', 'base', 'He ran ___ the wall.', 'He ran into the wall.', 2, 'Use "into" to show physical contact or collision.'),
(45, 'sentence_completion', 'easy', 'Dive ___ the pool.', 'en', 'into', 'base', 'Dive ___ the pool.', 'Dive into the pool.', 1, 'Use "into" for movement entering water.'),
(45, 'sentence_completion', 'easy', 'Translate this ___ Arabic.', 'en', 'into', 'base', 'Translate this ___ Arabic.', 'Translate this into Arabic.', 2, 'Use "into" to show change of language.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(353, 'خارج'), (353, 'على'), (353, 'تحت'), (353, 'بجانب'), (353, 'خلف'), (353, 'أمام'), (353, 'مع'), (353, 'من'), (353, 'عن'), (353, 'بـ'),
(354, 'out of'), (354, 'on'), (354, 'under'), (354, 'beside'), (354, 'behind'), (354, 'front'), (354, 'with'), (354, 'from'), (354, 'about'), (354, 'by'),
(355, 'out of'), (355, 'on'), (355, 'under'), (355, 'beside'), (355, 'behind'), (355, 'front'), (355, 'with'), (355, 'from'), (355, 'about'), (355, 'by'),
(356, 'out of'), (356, 'on'), (356, 'under'), (356, 'beside'), (356, 'behind'), (356, 'front'), (356, 'with'), (356, 'from'), (356, 'about'), (356, 'by'),
(357, 'out of'), (357, 'on'), (357, 'under'), (357, 'beside'), (357, 'behind'), (357, 'front'), (357, 'with'), (357, 'from'), (357, 'about'), (357, 'by'),
(358, 'out of'), (358, 'on'), (358, 'under'), (358, 'beside'), (358, 'behind'), (358, 'front'), (358, 'with'), (358, 'from'), (358, 'about'), (358, 'by'),
(359, 'out of'), (359, 'on'), (359, 'under'), (359, 'beside'), (359, 'behind'), (359, 'front'), (359, 'with'), (359, 'from'), (359, 'about'), (359, 'by'),
(360, 'out of'), (360, 'on'), (360, 'under'), (360, 'beside'), (360, 'behind'), (360, 'front'), (360, 'with'), (360, 'from'), (360, 'about'), (360, 'by');

-- =============================================================================
-- WORD 46: here (ID: 46, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (46, 'here', 'هنا', 'adv.', 'In, at, or to this place or position.', 'في هذا المكان أو الموقع أو إليه.', 'هنا', '["إلى هنا"]', '{"base": "here"}', '/hɪər/', 'here.mp3', '{"synonyms": ["present"], "antonyms": ["there"], "word_family": []}', 'Used to indicate the current location of the speaker.', 'Beginner', 78);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(46, 'Please come {here}.', 'من فضلك تعال هنا.', 'here', 'Instruction', 'Easy', 1, 1),
(46, 'I am {here} now.', 'أنا هنا الآن.', 'here', 'Location', 'Easy', 0, 2),
(46, 'Is anyone {here}?', 'هل يوجد أحد هنا؟', 'here', 'Inquiry', 'Easy', 0, 3),
(46, 'Put the box {here}.', 'ضع الصندوق هنا.', 'here', 'Instruction', 'Easy', 0, 4),
(46, 'It is very hot {here}.', 'الجو حار جداً هنا.', 'here', 'Weather', 'Easy', 0, 5),
(46, '{Here} is your coffee.', 'تفضل، هذا هو فنجان قهوتك.', 'here', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(46, 'translation_match', 'easy', 'here', 'en', 'هنا', 'base', NULL, NULL, NULL, '"here" refers to the place where the speaker is.'),
(46, 'reverse_translation', 'easy', 'هنا', 'ar', 'here', 'base', NULL, NULL, NULL, 'The Arabic "هنا" translates to "here" in English.'),
(46, 'sentence_completion', 'easy', 'Come ___ and sit down.', 'en', 'here', 'base', 'Come ___ and sit down.', 'Come here and sit down.', 1, 'Use "here" to invite someone to your current location.'),
(46, 'sentence_completion', 'easy', 'I have lived ___ for ten years.', 'en', 'here', 'base', 'I have lived ___ for ten years.', 'I have lived here for ten years.', 3, 'Use "here" to refer to your current place of residence.'),
(46, 'sentence_completion', 'easy', '___ is the book you wanted.', 'en', 'Here', 'base', '___ is the book you wanted.', 'Here is the book you wanted.', 0, 'Use "Here" when handing something to someone.'),
(46, 'sentence_completion', 'easy', 'Is it far from ___?', 'en', 'here', 'base', 'Is it far from ___?', 'Is it far from here?', 3, 'Use "here" as a reference point for distance.'),
(46, 'sentence_completion', 'easy', 'Wait ___ until I return.', 'en', 'here', 'base', 'Wait ___ until I return.', 'Wait here until I return.', 1, 'Use "here" to specify a waiting location.'),
(46, 'sentence_completion', 'easy', '___ we are!', 'en', 'Here', 'base', '___ we are!', 'Here we are!', 0, 'Common expression used upon arrival.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(361, 'هناك'), (361, 'أين'), (361, 'متى'), (361, 'كيف'), (361, 'من'), (361, 'إلى'), (361, 'في'), (361, 'على'), (361, 'مع'), (361, 'عن'),
(362, 'there'), (362, 'where'), (362, 'when'), (362, 'how'), (362, 'who'), (362, 'to'), (362, 'in'), (362, 'on'), (362, 'with'), (362, 'about'),
(363, 'there'), (363, 'where'), (363, 'when'), (363, 'how'), (363, 'who'), (363, 'to'), (363, 'in'), (363, 'on'), (363, 'with'), (363, 'about'),
(364, 'there'), (364, 'where'), (364, 'when'), (364, 'how'), (364, 'who'), (364, 'to'), (364, 'in'), (364, 'on'), (364, 'with'), (364, 'about'),
(365, 'There'), (365, 'Where'), (365, 'When'), (365, 'How'), (365, 'Who'), (365, 'To'), (365, 'In'), (365, 'On'), (365, 'With'), (365, 'About'),
(366, 'there'), (366, 'where'), (366, 'when'), (366, 'how'), (366, 'who'), (366, 'to'), (366, 'in'), (366, 'on'), (366, 'with'), (366, 'about'),
(367, 'there'), (367, 'where'), (367, 'when'), (367, 'how'), (367, 'who'), (367, 'to'), (367, 'in'), (367, 'on'), (367, 'with'), (367, 'about'),
(368, 'There'), (368, 'Where'), (368, 'When'), (368, 'How'), (368, 'Who'), (368, 'To'), (368, 'In'), (368, 'On'), (368, 'With'), (368, 'About');

-- =============================================================================
-- WORD 47: then (ID: 47, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (47, 'then', 'ثم', 'adv.', 'At that time; or after that; next.', 'في ذلك الوقت؛ أو بعد ذلك؛ التالي.', 'ثم', '["عندئذ", "إذن"]', '{"base": "then"}', '/ðɛn/', 'then.mp3', '{"synonyms": ["afterwards", "next"], "antonyms": ["now"], "word_family": []}', 'Used to sequence events or refer to a specific time in the past or future.', 'Beginner', 79);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(47, 'I was a student back {then}.', 'كنت طالباً في ذلك الوقت.', 'then', 'Time', 'Easy', 1, 1),
(47, 'First eat, {then} sleep.', 'كل أولاً، ثم نم.', 'then', 'Sequence', 'Easy', 0, 2),
(47, 'If you are tired, {then} rest.', 'إذا كنت متعباً، فاسترح إذن.', 'then', 'Condition', 'Easy', 0, 3),
(47, 'Since {then}, everything has changed.', 'منذ ذلك الحين، تغير كل شيء.', 'then', 'Time', 'Easy', 0, 4),
(47, 'Just {then}, the phone rang.', 'في تلك اللحظة، رن الهاتف.', 'then', 'Time', 'Easy', 0, 5),
(47, 'See you {then}!', 'أراك حينها!', 'then', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(47, 'translation_match', 'easy', 'then', 'en', 'ثم', 'base', NULL, NULL, NULL, '"then" is used to show sequence or a specific time.'),
(47, 'reverse_translation', 'easy', 'ثم', 'ar', 'then', 'base', NULL, NULL, NULL, 'The Arabic "ثم" translates to "then" in English.'),
(47, 'sentence_completion', 'easy', 'I will see you ___ at 5 PM.', 'en', 'then', 'base', 'I will see you ___ at 5 PM.', 'I will see you then at 5 PM.', 4, 'Use "then" to refer to a previously mentioned time.'),
(47, 'sentence_completion', 'easy', 'Wash your hands, ___ eat.', 'en', 'then', 'base', 'Wash your hands, ___ eat.', 'Wash your hands, then eat.', 3, 'Use "then" to show the next step in a sequence.'),
(47, 'sentence_completion', 'easy', 'Life was different ___ .', 'en', 'then', 'base', 'Life was different ___ .', 'Life was different then.', 3, 'Use "then" to refer to a past period.'),
(47, 'sentence_completion', 'easy', 'If it rains, ___ we stay home.', 'en', 'then', 'base', 'If it rains, ___ we stay home.', 'If it rains, then we stay home.', 3, 'Use "then" to introduce the result of a condition.'),
(47, 'sentence_completion', 'easy', 'He finished his work and ___ left.', 'en', 'then', 'base', 'He finished his work and ___ left.', 'He finished his work and then left.', 5, 'Use "then" to show chronological order.'),
(47, 'sentence_completion', 'easy', 'Until ___, goodbye.', 'en', 'then', 'base', 'Until ___, goodbye.', 'Until then, goodbye.', 1, 'Use "then" in the phrase "until then".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(369, 'الآن'), (369, 'هنا'), (369, 'هناك'), (369, 'متى'), (369, 'أين'), (369, 'كيف'), (369, 'من'), (369, 'إلى'), (369, 'في'), (369, 'على'),
(370, 'now'), (370, 'than'), (370, 'that'), (370, 'this'), (370, 'there'), (370, 'here'), (370, 'when'), (370, 'where'), (370, 'how'), (370, 'who'),
(371, 'now'), (371, 'than'), (371, 'that'), (371, 'this'), (371, 'there'), (371, 'here'), (371, 'when'), (371, 'where'), (371, 'how'), (371, 'who'),
(372, 'now'), (372, 'than'), (372, 'that'), (372, 'this'), (372, 'there'), (372, 'here'), (372, 'when'), (372, 'where'), (372, 'how'), (372, 'who'),
(373, 'now'), (373, 'than'), (373, 'that'), (373, 'this'), (373, 'there'), (373, 'here'), (373, 'when'), (373, 'where'), (373, 'how'), (373, 'who'),
(374, 'now'), (374, 'than'), (374, 'that'), (374, 'this'), (374, 'there'), (374, 'here'), (374, 'when'), (374, 'where'), (374, 'how'), (374, 'who'),
(375, 'now'), (375, 'than'), (375, 'that'), (375, 'this'), (375, 'there'), (375, 'here'), (375, 'when'), (375, 'where'), (375, 'how'), (375, 'who'),
(376, 'now'), (376, 'than'), (376, 'that'), (376, 'this'), (376, 'there'), (376, 'here'), (376, 'when'), (376, 'where'), (376, 'how'), (376, 'who');

-- =============================================================================
-- WORD 48: thing (ID: 48, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (48, 'thing', 'شيء', 'n.', 'An object that one need not or cannot name specifically.', 'كائن لا يحتاج المرء أو لا يستطيع تسميته على وجه التحديد.', 'شيء', '["أمر", "غرض"]', '{"singular": "thing", "plural": "things"}', '/θɪŋ/', 'thing.mp3', '{"synonyms": ["object", "item"], "antonyms": [], "word_family": ["everything", "nothing", "something"]}', 'A very general noun used for objects, ideas, or situations.', 'Beginner', 86);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(48, 'What is that {thing}?', 'ما هذا الشيء؟', 'thing', 'General', 'Easy', 1, 1),
(48, 'I have many {things} to do.', 'لدي الكثير من الأشياء لأفعلها.', 'things', 'Work', 'Easy', 0, 2),
(48, 'The best {thing} is to wait.', 'أفضل شيء هو الانتظار.', 'thing', 'Advice', 'Easy', 0, 3),
(48, 'Don''t touch my {things}.', 'لا تلمس أشيائي.', 'things', 'Possession', 'Easy', 0, 4),
(48, 'It was a strange {thing} to say.', 'كان شيئاً غريباً أن يقال.', 'thing', 'Communication', 'Easy', 0, 5),
(48, 'One more {thing}, please.', 'شيء واحد آخر، من فضلك.', 'thing', 'Requests', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(48, 'translation_match', 'easy', 'thing', 'en', 'شيء', 'singular', NULL, NULL, NULL, '"thing" is a general noun for an object or idea.'),
(48, 'reverse_translation', 'easy', 'شيء', 'ar', 'thing', 'singular', NULL, NULL, NULL, 'The Arabic "شيء" translates to "thing" in English.'),
(48, 'sentence_completion', 'easy', 'I forgot one ___ .', 'en', 'thing', 'singular', 'I forgot one ___ .', 'I forgot one thing.', 3, 'Use "thing" to refer to a single item or thought.'),
(48, 'sentence_completion', 'easy', 'Put your ___ in the bag.', 'en', 'things', 'plural', 'Put your ___ in the bag.', 'Put your things in the bag.', 2, 'Use "things" to refer to multiple personal belongings.'),
(48, 'sentence_completion', 'easy', 'It is a good ___ you came.', 'en', 'thing', 'singular', 'It is a good ___ you came.', 'It is a good thing you came.', 4, 'Common expression meaning "it is lucky".'),
(48, 'sentence_completion', 'easy', 'How are ___ going?', 'en', 'things', 'plural', 'How are ___ going?', 'How are things going?', 2, 'Use "things" to ask about someone''s general situation.'),
(48, 'sentence_completion', 'easy', 'It is a beautiful ___ .', 'en', 'thing', 'singular', 'It is a beautiful ___ .', 'It is a beautiful thing.', 4, 'Use "thing" to describe an abstract concept or object.'),
(48, 'sentence_completion', 'easy', 'I have so many ___ to tell you.', 'en', 'things', 'plural', 'I have so many ___ to tell you.', 'I have so many things to tell you.', 4, 'Use "things" to refer to multiple pieces of information.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(377, 'شخص'), (377, 'مكان'), (377, 'وقت'), (377, 'يوم'), (377, 'سنة'), (377, 'ناس'), (377, 'عمل'), (377, 'طريق'), (377, 'كلمة'), (377, 'اسم'),
(378, 'person'), (378, 'place'), (378, 'time'), (378, 'day'), (378, 'year'), (378, 'people'), (378, 'work'), (378, 'way'), (378, 'word'), (378, 'name'),
(379, 'person'), (379, 'place'), (379, 'time'), (379, 'day'), (379, 'year'), (379, 'people'), (379, 'work'), (379, 'way'), (379, 'word'), (379, 'name'),
(380, 'thing'), (380, 'person'), (380, 'place'), (380, 'time'), (380, 'day'), (380, 'year'), (380, 'people'), (380, 'work'), (380, 'way'), (380, 'word'),
(381, 'things'), (381, 'persons'), (381, 'places'), (381, 'times'), (381, 'days'), (381, 'years'), (381, 'people'), (381, 'works'), (381, 'ways'), (381, 'words'),
(382, 'thing'), (382, 'person'), (382, 'place'), (382, 'time'), (382, 'day'), (382, 'year'), (382, 'people'), (382, 'work'), (382, 'way'), (382, 'word'),
(383, 'things'), (383, 'persons'), (383, 'places'), (383, 'times'), (383, 'days'), (383, 'years'), (383, 'people'), (383, 'works'), (383, 'ways'), (383, 'words'),
(384, 'thing'), (384, 'person'), (384, 'place'), (384, 'time'), (384, 'day'), (384, 'year'), (384, 'people'), (384, 'work'), (384, 'way'), (384, 'word');

-- =============================================================================
-- WORD 49: also (ID: 49, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (49, 'also', 'أيضاً', 'adv.', 'In addition; too.', 'بالإضافة إلى ذلك؛ أيضاً.', 'أيضاً', '["كذلك"]', '{"base": "also"}', '/ˈɔːlsoʊ/', 'also.mp3', '{"synonyms": ["too", "as well"], "antonyms": [], "word_family": []}', 'Usually placed before the main verb or after the verb "be".', 'Beginner', 89);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(49, 'I {also} like coffee.', 'أنا أيضاً أحب القهوة.', 'also', 'Preferences', 'Easy', 1, 1),
(49, 'She is {also} a teacher.', 'هي أيضاً معلمة.', 'also', 'Jobs', 'Easy', 0, 2),
(49, 'He can speak French and {also} Spanish.', 'يمكنه التحدث بالفرنسية وأيضاً الإسبانية.', 'also', 'Ability', 'Easy', 0, 3),
(49, 'They {also} went to the party.', 'هم أيضاً ذهبوا إلى الحفلة.', 'also', 'Social', 'Easy', 0, 4),
(49, 'It is cold and {also} windy.', 'الجو بارد وأيضاً عاصف.', 'also', 'Weather', 'Easy', 0, 5),
(49, 'I {also} want to go home.', 'أنا أيضاً أريد الذهاب إلى المنزل.', 'also', 'Needs', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(49, 'translation_match', 'easy', 'also', 'en', 'أيضاً', 'base', NULL, NULL, NULL, '"also" is used to add information.'),
(49, 'reverse_translation', 'easy', 'أيضاً', 'ar', 'also', 'base', NULL, NULL, NULL, 'The Arabic "أيضاً" translates to "also".'),
(49, 'sentence_completion', 'easy', 'I am ___ a student.', 'en', 'also', 'base', 'I am ___ a student.', 'I am also a student.', 2, 'Use "also" after the verb "be".'),
(49, 'sentence_completion', 'easy', 'He ___ plays football.', 'en', 'also', 'base', 'He ___ plays football.', 'He also plays football.', 1, 'Use "also" before the main verb.'),
(49, 'sentence_completion', 'easy', 'She is kind and ___ smart.', 'en', 'also', 'base', 'She is kind and ___ smart.', 'She is kind and also smart.', 3, 'Use "also" to add another adjective.'),
(49, 'sentence_completion', 'easy', 'They ___ want to help.', 'en', 'also', 'base', 'They ___ want to help.', 'They also want to help.', 1, 'Use "also" to show addition of people wanting to help.'),
(49, 'sentence_completion', 'easy', 'I have a cat and ___ a dog.', 'en', 'also', 'base', 'I have a cat and ___ a dog.', 'I have a cat and also a dog.', 4, 'Use "also" to add another item to a list.'),
(49, 'sentence_completion', 'easy', 'It was late and ___ dark.', 'en', 'also', 'base', 'It was late and ___ dark.', 'It was late and also dark.', 3, 'Use "also" to add another condition.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(385, 'لكن'), (385, 'أو'), (385, 'إذا'), (385, 'فقط'), (385, 'جداً'), (385, 'هنا'), (385, 'هناك'), (385, 'الآن'), (385, 'من'), (385, 'إلى'),
(386, 'but'), (386, 'or'), (386, 'if'), (386, 'only'), (386, 'very'), (386, 'here'), (386, 'there'), (386, 'now'), (386, 'from'), (386, 'to'),
(387, 'but'), (387, 'or'), (387, 'if'), (387, 'only'), (387, 'very'), (387, 'here'), (387, 'there'), (387, 'now'), (387, 'from'), (387, 'to'),
(388, 'but'), (388, 'or'), (388, 'if'), (388, 'only'), (388, 'very'), (388, 'here'), (388, 'there'), (388, 'now'), (388, 'from'), (388, 'to'),
(389, 'but'), (389, 'or'), (389, 'if'), (389, 'only'), (389, 'very'), (389, 'here'), (389, 'there'), (389, 'now'), (389, 'from'), (389, 'to'),
(390, 'but'), (390, 'or'), (390, 'if'), (390, 'only'), (390, 'very'), (390, 'here'), (390, 'there'), (390, 'now'), (390, 'from'), (390, 'to'),
(391, 'but'), (391, 'or'), (391, 'if'), (391, 'only'), (391, 'very'), (391, 'here'), (391, 'there'), (391, 'now'), (391, 'from'), (391, 'to'),
(392, 'but'), (392, 'or'), (392, 'if'), (392, 'only'), (392, 'very'), (392, 'here'), (392, 'there'), (392, 'now'), (392, 'from'), (392, 'to');

-- =============================================================================
-- WORD 50: two (ID: 50, POS: number)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (50, 'two', 'اثنان', 'number', 'The number equivalent to the sum of one and one.', 'الرقم الذي يعادل مجموع واحد وواحد.', 'اثنان', '["رقم 2"]', '{"singular": "two"}', '/tuː/', 'two.mp3', '{"synonyms": ["pair", "couple"], "antonyms": [], "word_family": ["twice", "second"]}', 'Used to count items or indicate quantity.', 'Beginner', 90);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(50, 'I have {two} cats.', 'لدي قطتان.', 'two', 'Animals', 'Easy', 1, 1),
(50, '{Two} plus two is four.', 'اثنان زائد اثنان يساوي أربعة.', 'two', 'Math', 'Easy', 0, 2),
(50, 'I saw {two} birds in the tree.', 'رأيت عصفورين في الشجرة.', 'two', 'Nature', 'Easy', 0, 3),
(50, 'It is {two} o''clock.', 'إنها الساعة الثانية.', 'two', 'Time', 'Easy', 0, 4),
(50, 'Give me {two} apples, please.', 'أعطني تفاحتين من فضلك.', 'two', 'Food', 'Easy', 0, 5),
(50, 'They have {two} children.', 'لديهما طفلان.', 'two', 'Family', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(50, 'translation_match', 'easy', 'two', 'en', 'اثنان', 'singular', NULL, NULL, NULL, '"two" is the number 2.'),
(50, 'reverse_translation', 'easy', 'اثنان', 'ar', 'two', 'singular', NULL, NULL, NULL, 'The Arabic "اثنان" translates to "two" in English.'),
(50, 'sentence_completion', 'easy', 'I have ___ hands.', 'en', 'two', 'singular', 'I have ___ hands.', 'I have two hands.', 2, 'Humans typically have two hands.'),
(50, 'sentence_completion', 'easy', 'One, ___, three, four.', 'en', 'two', 'singular', 'One, ___, three, four.', 'One, two, three, four.', 1, 'The number following one is two.'),
(50, 'sentence_completion', 'easy', 'The meeting is at ___ PM.', 'en', 'two', 'singular', 'The meeting is at ___ PM.', 'The meeting is at two PM.', 4, 'Use "two" to indicate the hour.'),
(50, 'sentence_completion', 'easy', 'I bought ___ books today.', 'en', 'two', 'singular', 'I bought ___ books today.', 'I bought two books today.', 2, 'Use "two" to count plural nouns.'),
(50, 'sentence_completion', 'easy', '___ heads are better than one.', 'en', 'Two', 'singular', '___ heads are better than one.', 'Two heads are better than one.', 0, 'A common idiom meaning collaboration is good.'),
(50, 'sentence_completion', 'easy', 'There are ___ slices of pizza left.', 'en', 'two', 'singular', 'There are ___ slices of pizza left.', 'There are two slices of pizza left.', 2, 'Use "two" to indicate quantity.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(393, 'واحد'), (393, 'ثلاثة'), (393, 'أربعة'), (393, 'كثير'), (393, 'بعض'), (393, 'كل'), (393, 'لا شيء'), (393, 'أول'), (393, 'ثانٍ'), (393, 'آخر'),
(394, 'one'), (394, 'three'), (394, 'four'), (394, 'many'), (394, 'some'), (394, 'all'), (394, 'none'), (394, 'first'), (394, 'second'), (394, 'last'),
(395, 'one'), (395, 'three'), (395, 'four'), (395, 'many'), (395, 'some'), (395, 'all'), (395, 'none'), (395, 'first'), (395, 'second'), (395, 'last'),
(396, 'one'), (396, 'three'), (396, 'four'), (396, 'many'), (396, 'some'), (396, 'all'), (396, 'none'), (396, 'first'), (396, 'second'), (396, 'last'),
(397, 'one'), (397, 'three'), (397, 'four'), (397, 'many'), (397, 'some'), (397, 'all'), (397, 'none'), (397, 'first'), (397, 'second'), (397, 'last'),
(398, 'one'), (398, 'three'), (398, 'four'), (398, 'many'), (398, 'some'), (398, 'all'), (398, 'none'), (398, 'first'), (398, 'second'), (398, 'last'),
(399, 'One'), (399, 'Three'), (399, 'Four'), (399, 'Many'), (399, 'Some'), (399, 'All'), (399, 'None'), (399, 'First'), (399, 'Second'), (399, 'Last'),
(400, 'one'), (400, 'three'), (400, 'four'), (400, 'many'), (400, 'some'), (400, 'all'), (400, 'none'), (400, 'first'), (400, 'second'), (400, 'last');
-- =============================================================================
-- WORD 51: tell (ID: 51, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (51, 'tell', 'يخبر', 'v.', 'To communicate information, facts, or news to someone.', 'نقل المعلومات أو الحقائق أو الأخبار إلى شخص ما.', 'يخبر', '["يقول", "يروي"]', '{"base": "tell", "thirdPerson": "tells", "past": "told", "participle": "told", "gerund": "telling"}', '/tel/', 'tell.mp3', '{"synonyms": ["inform", "narrate"], "antonyms": ["listen", "hide"], "word_family": ["teller"]}', 'Usually requires an indirect object (tell someone something).', 'Beginner', 92);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(51, 'Please {tell} me the truth.', 'من فضلك أخبرني الحقيقة.', 'tell', 'Communication', 'Easy', 1, 1),
(51, 'He {tells} great stories.', 'هو يروي قصصاً رائعة.', 'tells', 'Social', 'Easy', 0, 2),
(51, 'She {told} me about her trip.', 'أخبرتني عن رحلتها.', 'told', 'Travel', 'Easy', 0, 3),
(51, 'I am {telling} you a secret.', 'أنا أخبرك بسراً.', 'telling', 'Communication', 'Easy', 0, 4),
(51, 'Can you {tell} the difference?', 'هل يمكنك تمييز الفرق؟', 'tell', 'General', 'Easy', 0, 5),
(51, 'They {told} us to wait here.', 'أخبرونا أن ننتظر هنا.', 'told', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(51, 'translation_match', 'easy', 'tell', 'en', 'يخبر', 'base', NULL, NULL, NULL, '"tell" is the base verb for communicating info to someone.'),
(51, 'reverse_translation', 'easy', 'يخبر', 'ar', 'tell', 'base', NULL, NULL, NULL, 'The Arabic verb "يخبر" translates to "tell".'),
(51, 'sentence_completion', 'easy', '___ me your name.', 'en', 'Tell', 'base', '___ me your name.', 'Tell me your name.', 0, 'Use the base form "Tell" for an imperative.'),
(51, 'sentence_completion', 'easy', 'He always ___ the truth.', 'en', 'tells', 'thirdPerson', 'He always ___ the truth.', 'He always tells the truth.', 2, 'Use "tells" for third-person singular present.'),
(51, 'sentence_completion', 'easy', 'She ___ me a lie yesterday.', 'en', 'told', 'past', 'She ___ me a lie yesterday.', 'She told me a lie yesterday.', 1, 'Use "told" for the past tense of "tell".'),
(51, 'sentence_completion', 'easy', 'I am ___ you for the last time.', 'en', 'telling', 'gerund', 'I am ___ you for the last time.', 'I am telling you for the last time.', 2, 'Use "telling" for the present continuous.'),
(51, 'sentence_completion', 'easy', 'Have you ___ him yet?', 'en', 'told', 'participle', 'Have you ___ him yet?', 'Have you told him yet?', 2, 'Use "told" as the past participle after "have".'),
(51, 'sentence_completion', 'easy', 'Don''t ___ anyone about this.', 'en', 'tell', 'base', 'Don''t ___ anyone about this.', 'Don''t tell anyone about this.', 1, 'Use the base form "tell" after "don''t".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(401, 'يسمع'), (401, 'يرى'), (401, 'يمشي'), (401, 'يأكل'), (401, 'يشرب'), (401, 'ينام'), (401, 'يذهب'), (401, 'يأتي'), (401, 'يفعل'), (401, 'يأخذ'),
(402, 'say'), (402, 'speak'), (402, 'talk'), (402, 'hear'), (402, 'see'), (402, 'walk'), (402, 'eat'), (402, 'drink'), (402, 'sleep'), (402, 'go'),
(403, 'Say'), (403, 'Speak'), (403, 'Talk'), (403, 'Hear'), (403, 'See'), (403, 'Walk'), (403, 'Eat'), (403, 'Drink'), (403, 'Sleep'), (403, 'Go'),
(404, 'tell'), (404, 'told'), (404, 'telling'), (404, 'says'), (404, 'said'), (404, 'speaks'), (404, 'spoke'), (404, 'talks'), (404, 'talked'), (404, 'hearing'),
(405, 'tell'), (405, 'tells'), (405, 'telling'), (405, 'say'), (405, 'says'), (405, 'said'), (405, 'speak'), (405, 'speaks'), (405, 'talk'), (405, 'talks'),
(406, 'tell'), (406, 'tells'), (406, 'told'), (406, 'say'), (406, 'saying'), (406, 'said'), (406, 'speak'), (406, 'speaking'), (406, 'talk'), (406, 'talking'),
(407, 'tell'), (407, 'tells'), (407, 'telling'), (407, 'say'), (407, 'says'), (407, 'said'), (407, 'speak'), (407, 'speaks'), (407, 'talk'), (407, 'talks'),
(408, 'tells'), (408, 'told'), (408, 'telling'), (408, 'say'), (408, 'says'), (408, 'said'), (408, 'speak'), (408, 'speaks'), (408, 'talk'), (408, 'talks');

-- =============================================================================
-- WORD 52: man (ID: 52, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (52, 'man', 'رجل', 'n.', 'An adult male human being.', 'إنسان ذكر بالغ.', 'رجل', '["بشر"]', '{"singular": "man", "plural": "men"}', '/mæn/', 'man.mp3', '{"synonyms": ["male", "gentleman"], "antonyms": ["woman"], "word_family": ["manly", "mankind"]}', 'Plural form is irregular: men.', 'Beginner', 95);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(52, 'He is a very kind {man}.', 'إنه رجل طيب جداً.', 'man', 'Personality', 'Easy', 1, 1),
(52, 'I saw a {man} in the park.', 'رأيت رجلاً في الحديقة.', 'man', 'General', 'Easy', 0, 2),
(52, 'The {men} are working outside.', 'الرجال يعملون في الخارج.', 'men', 'Work', 'Easy', 0, 3),
(52, 'Who is that {man}?', 'من ذلك الرجل؟', 'man', 'Identity', 'Easy', 0, 4),
(52, 'A young {man} helped me.', 'ساعدني شاب (رجل شاب).', 'man', 'Social', 'Easy', 0, 5),
(52, 'He is a {man} of his word.', 'إنه رجل يفي بكلمته.', 'man', 'Personality', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(52, 'translation_match', 'easy', 'man', 'en', 'رجل', 'singular', NULL, NULL, NULL, '"man" refers to an adult male human.'),
(52, 'reverse_translation', 'easy', 'رجل', 'ar', 'man', 'singular', NULL, NULL, NULL, 'The Arabic "رجل" translates to "man" in English.'),
(52, 'sentence_completion', 'easy', 'That ___ is my father.', 'en', 'man', 'singular', 'That ___ is my father.', 'That man is my father.', 1, 'Use "man" for a single adult male.'),
(52, 'sentence_completion', 'easy', 'Three ___ are standing there.', 'en', 'men', 'plural', 'Three ___ are standing there.', 'Three men are standing there.', 1, 'Use "men" as the irregular plural of "man".'),
(52, 'sentence_completion', 'easy', 'He is a good ___ .', 'en', 'man', 'singular', 'He is a good ___ .', 'He is a good man.', 4, 'Use "man" to describe an individual male.'),
(52, 'sentence_completion', 'easy', 'The ___ and the woman are friends.', 'en', 'man', 'singular', 'The ___ and the woman are friends.', 'The man and the woman are friends.', 1, 'Use "man" as the counterpart to "woman".'),
(52, 'sentence_completion', 'easy', 'Old ___ often have wisdom.', 'en', 'men', 'plural', 'Old ___ often have wisdom.', 'Old men often have wisdom.', 1, 'Use "men" for a plural group of males.'),
(52, 'sentence_completion', 'easy', 'Is he a young ___?', 'en', 'man', 'singular', 'Is he a young ___?', 'Is he a young man?', 4, 'Use "man" to refer to an adult male.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(409, 'امرأة'), (409, 'طفل'), (409, 'بنت'), (409, 'ولد'), (409, 'حيوان'), (409, 'شيء'), (409, 'مكان'), (409, 'وقت'), (409, 'يوم'), (409, 'سنة'),
(410, 'woman'), (410, 'child'), (410, 'girl'), (410, 'boy'), (410, 'animal'), (410, 'thing'), (410, 'place'), (410, 'time'), (410, 'day'), (410, 'year'),
(411, 'woman'), (411, 'men'), (411, 'boy'), (411, 'girl'), (411, 'child'), (411, 'person'), (411, 'people'), (411, 'animal'), (411, 'thing'), (411, 'place'),
(412, 'man'), (412, 'woman'), (412, 'women'), (412, 'boy'), (412, 'boys'), (412, 'girl'), (412, 'girls'), (412, 'child'), (412, 'children'), (412, 'person'),
(413, 'men'), (413, 'woman'), (413, 'girl'), (413, 'boy'), (413, 'child'), (413, 'person'), (413, 'people'), (413, 'animal'), (413, 'thing'), (413, 'place'),
(414, 'men'), (414, 'woman'), (414, 'girl'), (414, 'boy'), (414, 'child'), (414, 'person'), (414, 'people'), (414, 'animal'), (414, 'thing'), (414, 'place'),
(415, 'man'), (415, 'woman'), (415, 'women'), (415, 'boy'), (415, 'boys'), (415, 'girl'), (415, 'girls'), (415, 'child'), (415, 'children'), (415, 'person'),
(416, 'men'), (416, 'woman'), (416, 'girl'), (416, 'boy'), (416, 'child'), (416, 'person'), (416, 'people'), (416, 'animal'), (416, 'thing'), (416, 'place');

-- =============================================================================
-- WORD 53: day (ID: 53, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (53, 'day', 'يوم', 'n.', 'A period of twenty-four hours; or the time between sunrise and sunset.', 'فترة أربع وعشرين ساعة؛ أو الوقت بين شروق الشمس وغروبها.', 'يوم', '["نهار"]', '{"singular": "day", "plural": "days"}', '/deɪ/', 'day.mp3', '{"synonyms": ["date", "daytime"], "antonyms": ["night"], "word_family": ["daily", "daylight"]}', 'Used to measure time and dates.', 'Beginner', 96);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(53, 'It is a beautiful {day}.', 'إنه يوم جميل.', 'day', 'Weather', 'Easy', 1, 1),
(53, 'I work every {day}.', 'أنا أعمل كل يوم.', 'day', 'Routine', 'Easy', 0, 2),
(53, 'How was your {day}?', 'كيف كان يومك؟', 'day', 'Social', 'Easy', 0, 3),
(53, 'There are seven {days} in a week.', 'هناك سبعة أيام في الأسبوع.', 'days', 'Time', 'Easy', 0, 4),
(53, 'Have a nice {day}!', 'أتمنى لك يوماً سعيداً!', 'day', 'Social', 'Easy', 0, 5),
(53, 'I saw him the other {day}.', 'رأيته في ذلك اليوم (منذ فترة قصيرة).', 'day', 'Time', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(53, 'translation_match', 'easy', 'day', 'en', 'يوم', 'singular', NULL, NULL, NULL, '"day" is a unit of time equal to 24 hours.'),
(53, 'reverse_translation', 'easy', 'يوم', 'ar', 'day', 'singular', NULL, NULL, NULL, 'The Arabic "يوم" translates to "day" in English.'),
(53, 'sentence_completion', 'easy', 'What ___ is it today?', 'en', 'day', 'singular', 'What ___ is it today?', 'What day is it today?', 1, 'Use "day" to ask about the current date or day of the week.'),
(53, 'sentence_completion', 'easy', 'I will stay for three ___ .', 'en', 'days', 'plural', 'I will stay for three ___ .', 'I will stay for three days.', 4, 'Use "days" for a duration of more than one day.'),
(53, 'sentence_completion', 'easy', 'It was a long ___ at work.', 'en', 'day', 'singular', 'It was a long ___ at work.', 'It was a long day at work.', 3, 'Use "day" to describe a period of time spent working.'),
(53, 'sentence_completion', 'easy', '___ and night.', 'en', 'Day', 'singular', '___ and night.', 'Day and night.', 0, 'Use "Day" as the opposite of "night".'),
(53, 'sentence_completion', 'easy', 'I exercise every ___ .', 'en', 'day', 'singular', 'I exercise every ___ .', 'I exercise every day.', 3, 'Use "day" after "every" to show frequency.'),
(53, 'sentence_completion', 'easy', 'In those ___ , life was simple.', 'en', 'days', 'plural', 'In those ___ , life was simple.', 'In those days, life was simple.', 2, 'Use "days" to refer to a past period of time.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(417, 'شهر'), (417, 'سنة'), (417, 'أسبوع'), (417, 'ساعة'), (417, 'دقيقة'), (417, 'ثانية'), (417, 'وقت'), (417, 'ليل'), (417, 'صباح'), (417, 'مساء'),
(418, 'month'), (418, 'year'), (418, 'week'), (418, 'hour'), (418, 'minute'), (418, 'second'), (418, 'time'), (418, 'night'), (418, 'morning'), (418, 'evening'),
(419, 'days'), (419, 'month'), (419, 'year'), (419, 'week'), (419, 'hour'), (419, 'minute'), (419, 'second'), (419, 'time'), (419, 'night'), (419, 'morning'),
(420, 'day'), (420, 'month'), (420, 'year'), (420, 'week'), (420, 'hour'), (420, 'minute'), (420, 'second'), (420, 'time'), (420, 'night'), (420, 'morning'),
(421, 'days'), (421, 'month'), (421, 'year'), (421, 'week'), (421, 'hour'), (421, 'minute'), (421, 'second'), (421, 'time'), (421, 'night'), (421, 'morning'),
(422, 'Days'), (422, 'Month'), (422, 'Year'), (422, 'Week'), (422, 'Hour'), (422, 'Minute'), (422, 'Second'), (422, 'Time'), (422, 'Night'), (422, 'Morning'),
(423, 'days'), (423, 'month'), (423, 'year'), (423, 'week'), (423, 'hour'), (423, 'minute'), (423, 'second'), (423, 'time'), (423, 'night'), (423, 'morning'),
(424, 'day'), (424, 'month'), (424, 'year'), (424, 'week'), (424, 'hour'), (424, 'minute'), (424, 'second'), (424, 'time'), (424, 'night'), (424, 'morning');

-- =============================================================================
-- WORD 54: find (ID: 54, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (54, 'find', 'يجد', 'v.', 'To discover or perceive by chance or after a search.', 'الاكتشاف أو الإدراك بالصدفة أو بعد البحث.', 'يجد', '["يعثر على", "يكتشف"]', '{"base": "find", "thirdPerson": "finds", "past": "found", "participle": "found", "gerund": "finding"}', '/faɪnd/', 'find.mp3', '{"synonyms": ["discover", "locate"], "antonyms": ["lose", "miss"], "word_family": ["finding", "finder"]}', 'Irregular verb: find, found, found.', 'Beginner', 97);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(54, 'I can''t {find} my keys.', 'لا أستطيع إيجاد مفاتيحي.', 'find', 'Possession', 'Easy', 1, 1),
(54, 'She {finds} it difficult to sleep.', 'تجد صعوبة في النوم.', 'finds', 'State', 'Easy', 0, 2),
(54, 'He {found} a job in London.', 'وجد وظيفة في لندن.', 'found', 'Work', 'Easy', 0, 3),
(54, 'I am {finding} this book very interesting.', 'أجد هذا الكتاب ممتعاً جداً.', 'finding', 'Opinion', 'Easy', 0, 4),
(54, 'Have you {found} what you were looking for?', 'هل وجدت ما كنت تبحث عنه؟', 'found', 'General', 'Easy', 0, 5),
(54, 'Go and {find} your brother.', 'اذهب وجد أخاك.', 'find', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(54, 'translation_match', 'easy', 'find', 'en', 'يجد', 'base', NULL, NULL, NULL, '"find" is the base verb for discovering something.'),
(54, 'reverse_translation', 'easy', 'يجد', 'ar', 'find', 'base', NULL, NULL, NULL, 'The Arabic verb "يجد" translates to "find".'),
(54, 'sentence_completion', 'easy', 'I need to ___ a taxi.', 'en', 'find', 'base', 'I need to ___ a taxi.', 'I need to find a taxi.', 3, 'Use the base form "find" after "need to".'),
(54, 'sentence_completion', 'easy', 'He ___ a coin on the street yesterday.', 'en', 'found', 'past', 'He ___ a coin on the street yesterday.', 'He found a coin on the street yesterday.', 1, 'Use "found" for the past tense of "find".'),
(54, 'sentence_completion', 'easy', 'She always ___ a way to help.', 'en', 'finds', 'thirdPerson', 'She always ___ a way to help.', 'She always finds a way to help.', 2, 'Use "finds" for third-person singular present.'),
(54, 'sentence_completion', 'easy', 'I am ___ it hard to focus.', 'en', 'finding', 'gerund', 'I am ___ it hard to focus.', 'I am finding it hard to focus.', 2, 'Use "finding" for the present continuous state.'),
(54, 'sentence_completion', 'easy', 'Has he ___ his phone yet?', 'en', 'found', 'participle', 'Has he ___ his phone yet?', 'Has he found his phone yet?', 2, 'Use "found" as the past participle after "has".'),
(54, 'sentence_completion', 'easy', 'Help me ___ my glasses.', 'en', 'find', 'base', 'Help me ___ my glasses.', 'Help me find my glasses.', 2, 'Use the base form "find" after "help me".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(425, 'يفقد'), (425, 'يذهب'), (425, 'يأكل'), (425, 'ينام'), (425, 'يرى'), (425, 'يأخذ'), (425, 'يعطي'), (425, 'يقول'), (425, 'يفعل'), (425, 'يصنع'),
(426, 'lose'), (426, 'miss'), (426, 'go'), (426, 'eat'), (426, 'sleep'), (426, 'see'), (426, 'take'), (426, 'give'), (426, 'say'), (426, 'do'),
(427, 'finds'), (427, 'found'), (427, 'finding'), (427, 'loses'), (427, 'lost'), (427, 'goes'), (427, 'went'), (427, 'sees'), (427, 'saw'), (427, 'takes'),
(428, 'find'), (428, 'finds'), (428, 'finding'), (428, 'lose'), (428, 'loses'), (428, 'lost'), (428, 'go'), (428, 'goes'), (428, 'went'), (428, 'see'),
(429, 'find'), (429, 'found'), (429, 'finding'), (429, 'lose'), (429, 'loses'), (429, 'lost'), (429, 'go'), (429, 'goes'), (429, 'went'), (429, 'see'),
(430, 'find'), (430, 'finds'), (430, 'found'), (430, 'lose'), (430, 'loses'), (430, 'lost'), (430, 'go'), (430, 'goes'), (430, 'went'), (430, 'see'),
(431, 'find'), (431, 'finds'), (431, 'finding'), (431, 'lose'), (431, 'loses'), (431, 'lost'), (431, 'go'), (431, 'goes'), (431, 'went'), (431, 'see'),
(432, 'finds'), (432, 'found'), (432, 'finding'), (432, 'lose'), (432, 'loses'), (432, 'lost'), (432, 'go'), (432, 'goes'), (432, 'went'), (432, 'see');

-- =============================================================================
-- WORD 55: give (ID: 55, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (55, 'give', 'يعطي', 'v.', 'To freely transfer the possession of something to someone.', 'نقل ملكية شيء ما إلى شخص آخر بحرية.', 'يعطي', '["يمنح", "يقدم"]', '{"base": "give", "thirdPerson": "gives", "past": "gave", "participle": "given", "gerund": "giving"}', '/ɡɪv/', 'give.mp3', '{"synonyms": ["provide", "offer"], "antonyms": ["take", "receive"], "word_family": ["gift", "giver"]}', 'A common irregular verb.', 'Beginner', 98);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(55, 'Please {give} me the pen.', 'من فضلك أعطني القلم.', 'give', 'Requests', 'Easy', 1, 1),
(55, 'She {gives} a lot to charity.', 'هي تعطي الكثير للجمعيات الخيرية.', 'gives', 'Social', 'Easy', 0, 2),
(55, 'He {gave} me a gift.', 'أعطاني هدية.', 'gave', 'Giving', 'Easy', 0, 3),
(55, 'I have {given} him the news.', 'لقد أخبرته بالأخبار (أعطيته الأخبار).', 'given', 'Communication', 'Easy', 0, 4),
(55, 'They are {giving} a presentation.', 'هم يقدمون عرضاً تقديمياً.', 'giving', 'Work', 'Easy', 0, 5),
(55, 'Can you {give} it back?', 'هل يمكنك إعادته؟ (إعطاؤه مرة أخرى)', 'give', 'Requests', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(55, 'translation_match', 'easy', 'give', 'en', 'يعطي', 'base', NULL, NULL, NULL, '"give" is the base verb for transferring something to another.'),
(55, 'reverse_translation', 'easy', 'يعطي', 'ar', 'give', 'base', NULL, NULL, NULL, 'The Arabic verb "يعطي" translates to "give".'),
(55, 'sentence_completion', 'easy', 'I will ___ you a call.', 'en', 'give', 'base', 'I will ___ you a call.', 'I will give you a call.', 2, 'Use the base form "give" after "will".'),
(55, 'sentence_completion', 'easy', 'He ___ me a book yesterday.', 'en', 'gave', 'past', 'He ___ me a book yesterday.', 'He gave me a book yesterday.', 1, 'Use "gave" for the past tense of "give".'),
(55, 'sentence_completion', 'easy', 'She always ___ good advice.', 'en', 'gives', 'thirdPerson', 'She always ___ good advice.', 'She always gives good advice.', 2, 'Use "gives" for third-person singular present.'),
(55, 'sentence_completion', 'easy', 'They are ___ out free samples.', 'en', 'giving', 'gerund', 'They are ___ out free samples.', 'They are giving out free samples.', 2, 'Use "giving" for the present continuous action.'),
(55, 'sentence_completion', 'easy', 'I have ___ my old clothes away.', 'en', 'given', 'participle', 'I have ___ my old clothes away.', 'I have given my old clothes away.', 2, 'Use "given" as the past participle after "have".'),
(55, 'sentence_completion', 'easy', '___ me a minute, please.', 'en', 'Give', 'base', '___ me a minute, please.', 'Give me a minute, please.', 0, 'Use the base form "Give" for imperatives.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(433, 'يأخذ'), (433, 'يضع'), (433, 'يذهب'), (433, 'يأكل'), (433, 'ينام'), (433, 'يرى'), (433, 'يفعل'), (433, 'يقول'), (433, 'يأتي'), (433, 'يصنع'),
(434, 'take'), (434, 'put'), (434, 'go'), (434, 'eat'), (434, 'sleep'), (434, 'see'), (434, 'do'), (434, 'say'), (434, 'come'), (434, 'make'),
(435, 'gives'), (435, 'gave'), (435, 'given'), (435, 'giving'), (435, 'takes'), (435, 'took'), (435, 'taken'), (435, 'taking'), (435, 'puts'), (435, 'putting'),
(436, 'give'), (436, 'gives'), (436, 'given'), (436, 'giving'), (436, 'take'), (436, 'took'), (436, 'taken'), (436, 'taking'), (436, 'put'), (436, 'puts'),
(437, 'give'), (437, 'gave'), (437, 'given'), (437, 'giving'), (437, 'take'), (437, 'took'), (437, 'taken'), (437, 'taking'), (437, 'put'), (437, 'puts'),
(438, 'give'), (438, 'gives'), (438, 'gave'), (438, 'given'), (438, 'take'), (438, 'took'), (438, 'taken'), (438, 'taking'), (438, 'put'), (438, 'puts'),
(439, 'give'), (439, 'gives'), (439, 'gave'), (439, 'giving'), (439, 'take'), (439, 'took'), (439, 'taken'), (439, 'taking'), (439, 'put'), (439, 'puts'),
(440, 'Gives'), (440, 'Gave'), (440, 'Given'), (440, 'Giving'), (440, 'Takes'), (440, 'Took'), (440, 'Taken'), (440, 'Taking'), (440, 'Puts'), (440, 'Putting');

-- =============================================================================
-- WORD 56: more (ID: 56, POS: det./pron., adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (56, 'more', 'أكثر', 'det./pron., adv.', 'A greater or additional amount or degree.', 'كمية أو درجة أكبر أو إضافية.', 'أكثر', '["مزيد"]', '{"base": "more", "superlative": "most"}', '/mɔːr/', 'more.mp3', '{"synonyms": ["additional", "extra"], "antonyms": ["less", "fewer"], "word_family": ["most"]}', 'Used to form the comparative of many adjectives and adverbs.', 'Beginner', 99);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(56, 'I need {more} water.', 'أحتاج إلى مزيد من الماء.', 'more', 'Needs', 'Easy', 1, 1),
(56, 'Can you tell me {more}?', 'هل يمكنك إخباري بالمزيد؟', 'more', 'Communication', 'Easy', 0, 2),
(56, 'This book is {more} interesting.', 'هذا الكتاب أكثر إثارة للاهتمام.', 'more', 'Opinion', 'Easy', 0, 3),
(56, 'We need {more} time.', 'نحتاج إلى وقت أطول.', 'more', 'Time', 'Easy', 0, 4),
(56, 'I want {more} coffee, please.', 'أريد المزيد من القهوة من فضلك.', 'more', 'Food', 'Easy', 0, 5),
(56, 'He is {more} than a friend.', 'هو أكثر من مجرد صديق.', 'more', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(56, 'translation_match', 'easy', 'more', 'en', 'أكثر', 'base', NULL, NULL, NULL, '"more" indicates a greater quantity or degree.'),
(56, 'reverse_translation', 'easy', 'أكثر', 'ar', 'more', 'base', NULL, NULL, NULL, 'The Arabic "أكثر" translates to "more" in English.'),
(56, 'sentence_completion', 'easy', 'I want ___ cake, please.', 'en', 'more', 'base', 'I want ___ cake, please.', 'I want more cake, please.', 2, 'Use "more" to ask for an additional amount.'),
(56, 'sentence_completion', 'easy', 'He is ___ famous than me.', 'en', 'more', 'base', 'He is ___ famous than me.', 'He is more famous than me.', 2, 'Use "more" to form the comparative of long adjectives.'),
(56, 'sentence_completion', 'easy', 'We need ___ people to help.', 'en', 'more', 'base', 'We need ___ people to help.', 'We need more people to help.', 2, 'Use "more" to indicate an additional number of people.'),
(56, 'sentence_completion', 'easy', 'Read ___ books to learn.', 'en', 'more', 'base', 'Read ___ books to learn.', 'Read more books to learn.', 1, 'Use "more" to suggest a greater quantity.'),
(56, 'sentence_completion', 'easy', 'It costs ___ than ten dollars.', 'en', 'more', 'base', 'It costs ___ than ten dollars.', 'It costs more than ten dollars.', 2, 'Use "more" with "than" to show a higher price.'),
(56, 'sentence_completion', 'easy', 'Tell me ___ about your trip.', 'en', 'more', 'base', 'Tell me ___ about your trip.', 'Tell me more about your trip.', 2, 'Use "more" to request additional information.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(441, 'أقل'), (441, 'كثير'), (441, 'بعض'), (441, 'كل'), (441, 'لا شيء'), (441, 'واحد'), (441, 'جداً'), (441, 'هنا'), (441, 'هناك'), (441, 'الآن'),
(442, 'less'), (442, 'most'), (442, 'many'), (442, 'some'), (442, 'all'), (442, 'none'), (442, 'very'), (442, 'only'), (442, 'little'), (442, 'few'),
(443, 'less'), (443, 'most'), (443, 'many'), (443, 'some'), (443, 'all'), (443, 'none'), (443, 'very'), (443, 'only'), (443, 'little'), (443, 'few'),
(444, 'less'), (444, 'most'), (444, 'many'), (444, 'some'), (444, 'all'), (444, 'none'), (444, 'very'), (444, 'only'), (444, 'little'), (444, 'few'),
(445, 'less'), (445, 'most'), (445, 'many'), (445, 'some'), (445, 'all'), (445, 'none'), (445, 'very'), (445, 'only'), (445, 'little'), (445, 'few'),
(446, 'less'), (446, 'most'), (446, 'many'), (446, 'some'), (446, 'all'), (446, 'none'), (446, 'very'), (446, 'only'), (446, 'little'), (446, 'few'),
(447, 'less'), (447, 'most'), (447, 'many'), (447, 'some'), (447, 'all'), (447, 'none'), (447, 'very'), (447, 'only'), (447, 'little'), (447, 'few'),
(448, 'less'), (448, 'most'), (448, 'many'), (448, 'some'), (448, 'all'), (448, 'none'), (448, 'very'), (448, 'only'), (448, 'little'), (448, 'few');

-- =============================================================================
-- WORD 57: new (ID: 57, POS: adj.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (57, 'new', 'جديد', 'adj.', 'Not existing before; made, introduced, or discovered recently.', 'لم يكن موجوداً من قبل؛ صُنع أو قُدم أو اكتشف مؤخراً.', 'جديد', '["حديث"]', '{"base": "new", "comparative": "newer", "superlative": "newest"}', '/nuː/', 'new.mp3', '{"synonyms": ["fresh", "recent", "modern"], "antonyms": ["old", "ancient"], "word_family": ["newly", "newness"]}', 'Used to describe things that are not old.', 'Beginner', 100);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(57, 'I bought a {new} car.', 'اشتريت سيارة جديدة.', 'new', 'Possession', 'Easy', 1, 1),
(57, 'Happy {New} Year!', 'سنة جديدة سعيدة!', 'new', 'Social', 'Easy', 0, 2),
(57, 'She has a {new} job.', 'لديها وظيفة جديدة.', 'new', 'Work', 'Easy', 0, 3),
(57, 'This is a {new} book.', 'هذا كتاب جديد.', 'new', 'General', 'Easy', 0, 4),
(57, 'I need {new} shoes.', 'أحتاج إلى أحذية جديدة.', 'new', 'Needs', 'Easy', 0, 5),
(57, 'He is a {new} student.', 'إنه طالب جديد.', 'new', 'Education', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(57, 'translation_match', 'easy', 'new', 'en', 'جديد', 'base', NULL, NULL, NULL, '"new" is the opposite of "old".'),
(57, 'reverse_translation', 'easy', 'جديد', 'ar', 'new', 'base', NULL, NULL, NULL, 'The Arabic "جديد" translates to "new" in English.'),
(57, 'sentence_completion', 'easy', 'I have a ___ phone.', 'en', 'new', 'base', 'I have a ___ phone.', 'I have a new phone.', 3, 'Use "new" to describe a recently bought phone.'),
(57, 'sentence_completion', 'easy', 'Welcome to our ___ house.', 'en', 'new', 'base', 'Welcome to our ___ house.', 'Welcome to our new house.', 3, 'Use "new" to describe a house you just moved into.'),
(57, 'sentence_completion', 'easy', 'This is the ___ model.', 'en', 'newest', 'superlative', 'This is the ___ model.', 'This is the newest model.', 3, 'Use "newest" to mean the most recent one.'),
(57, 'sentence_completion', 'easy', 'I like your ___ haircut.', 'en', 'new', 'base', 'I like your ___ haircut.', 'I like your new haircut.', 3, 'Use "new" for a recent change in appearance.'),
(57, 'sentence_completion', 'easy', 'Everything looks ___ in the spring.', 'en', 'new', 'base', 'Everything looks ___ in the spring.', 'Everything looks new in the spring.', 2, 'Use "new" to describe freshness.'),
(57, 'sentence_completion', 'easy', 'Is your car ___ or old?', 'en', 'new', 'base', 'Is your car ___ or old?', 'Is your car new or old?', 3, 'Use "new" as the opposite of "old".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(449, 'قديم'), (449, 'كبير'), (449, 'صغير'), (449, 'جيد'), (449, 'سيء'), (449, 'سريع'), (449, 'بطيء'), (449, 'حار'), (449, 'بارد'), (449, 'جميل'),
(450, 'old'), (450, 'big'), (450, 'small'), (450, 'good'), (450, 'bad'), (450, 'fast'), (450, 'slow'), (450, 'hot'), (450, 'cold'), (450, 'beautiful'),
(451, 'old'), (451, 'big'), (451, 'small'), (451, 'good'), (451, 'bad'), (451, 'fast'), (451, 'slow'), (451, 'hot'), (451, 'cold'), (451, 'beautiful'),
(452, 'old'), (452, 'big'), (452, 'small'), (452, 'good'), (452, 'bad'), (452, 'fast'), (452, 'slow'), (452, 'hot'), (452, 'cold'), (452, 'beautiful'),
(453, 'new'), (453, 'newer'), (453, 'old'), (453, 'older'), (453, 'oldest'), (453, 'big'), (453, 'bigger'), (453, 'biggest'), (453, 'good'), (453, 'best'),
(454, 'old'), (454, 'big'), (454, 'small'), (454, 'good'), (454, 'bad'), (454, 'fast'), (454, 'slow'), (454, 'hot'), (454, 'cold'), (454, 'beautiful'),
(455, 'old'), (455, 'big'), (455, 'small'), (455, 'good'), (455, 'bad'), (455, 'fast'), (455, 'slow'), (455, 'hot'), (455, 'cold'), (455, 'beautiful'),
(456, 'old'), (456, 'big'), (456, 'small'), (456, 'good'), (456, 'bad'), (456, 'fast'), (456, 'slow'), (456, 'hot'), (456, 'cold'), (456, 'beautiful');

-- =============================================================================
-- WORD 58: us (ID: 58, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (58, 'us', 'نا / نحن (مفعول به)', 'pron.', 'Used by a speaker to refer to himself or herself and one or more other people as the object.', 'يستخدمه المتحدث للإشارة إلى نفسه وشخص آخر أو أكثر كمفعول به.', 'نا / نحن (مفعول به)', '["إيانا"]', '{"object": "us"}', '/ʌs/', 'us.mp3', '{"synonyms": [], "antonyms": [], "word_family": ["we", "our", "ours", "ourselves"]}', 'The object form of the pronoun "we".', 'Beginner', 102);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(58, 'Come with {us}.', 'تعال معنا.', 'us', 'Social', 'Easy', 1, 1),
(58, 'He told {us} a story.', 'حكى لنا قصة.', 'us', 'Communication', 'Easy', 0, 2),
(58, 'They saw {us} at the mall.', 'رأونا في المركز التجاري.', 'us', 'Social', 'Easy', 0, 3),
(58, 'Give {us} some water, please.', 'أعطنا بعض الماء من فضلك.', 'us', 'Needs', 'Easy', 0, 4),
(58, 'Join {us} for dinner.', 'انضم إلينا لتناول العشاء.', 'us', 'Social', 'Easy', 0, 5),
(58, 'She called {us} yesterday.', 'اتصلت بنا أمس.', 'us', 'Communication', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(58, 'translation_match', 'easy', 'us', 'en', 'نا / نحن (مفعول به)', 'object', NULL, NULL, NULL, '"us" is the object pronoun for a group including the speaker.'),
(58, 'reverse_translation', 'easy', 'نا', 'ar', 'us', 'object', NULL, NULL, NULL, 'The Arabic suffix "نا" often translates to "us" in English.'),
(58, 'sentence_completion', 'easy', 'Wait for ___!', 'en', 'us', 'object', 'Wait for ___!', 'Wait for us!', 2, 'Use "us" after the preposition "for" to refer to the speaker''s group.'),
(58, 'sentence_completion', 'easy', 'Can you help ___?', 'en', 'us', 'object', 'Can you help ___?', 'Can you help us?', 3, 'Use "us" as the object of the verb "help".'),
(58, 'sentence_completion', 'easy', 'He gave ___ a gift.', 'en', 'us', 'object', 'He gave ___ a gift.', 'He gave us a gift.', 2, 'Use "us" as the indirect object of the verb "gave".'),
(58, 'sentence_completion', 'easy', 'They are looking at ___ .', 'en', 'us', 'object', 'They are looking at ___ .', 'They are looking at us.', 4, 'Use "us" after the preposition "at".'),
(58, 'sentence_completion', 'easy', 'Tell ___ the truth.', 'en', 'us', 'object', 'Tell ___ the truth.', 'Tell us the truth.', 1, 'Use "us" as the object of the verb "tell".'),
(58, 'sentence_completion', 'easy', 'The teacher saw ___ in the hall.', 'en', 'us', 'object', 'The teacher saw ___ in the hall.', 'The teacher saw us in the hall.', 3, 'Use "us" as the object of the verb "saw".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(457, 'أنا'), (457, 'هو'), (457, 'هي'), (457, 'هم'), (457, 'أنت'), (457, 'إياي'), (457, 'إياه'), (457, 'إياها'), (457, 'إياهم'), (457, 'إياك'),
(458, 'me'), (458, 'him'), (458, 'her'), (458, 'them'), (458, 'you'), (458, 'it'), (458, 'we'), (458, 'our'), (458, 'my'), (458, 'their'),
(459, 'me'), (459, 'him'), (459, 'her'), (459, 'them'), (459, 'you'), (459, 'it'), (459, 'we'), (459, 'our'), (459, 'my'), (459, 'their'),
(460, 'me'), (460, 'him'), (460, 'her'), (460, 'them'), (460, 'you'), (460, 'it'), (460, 'we'), (460, 'our'), (460, 'my'), (460, 'their'),
(461, 'me'), (461, 'him'), (461, 'her'), (461, 'them'), (461, 'you'), (461, 'it'), (461, 'we'), (461, 'our'), (461, 'my'), (461, 'their'),
(462, 'me'), (462, 'him'), (462, 'her'), (462, 'them'), (462, 'you'), (462, 'it'), (462, 'we'), (462, 'our'), (462, 'my'), (462, 'their'),
(463, 'me'), (463, 'him'), (463, 'her'), (463, 'them'), (463, 'you'), (463, 'it'), (463, 'we'), (463, 'our'), (463, 'my'), (463, 'their'),
(464, 'me'), (464, 'him'), (464, 'her'), (464, 'them'), (464, 'you'), (464, 'it'), (464, 'we'), (464, 'our'), (464, 'my'), (464, 'their');

-- =============================================================================
-- WORD 59: her (ID: 59, POS: pron., det.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (59, 'her', 'لها / ـها', 'pron., det.', 'Used as the object of a verb or preposition, or as a possessive determiner for a female.', 'تستخدم كمفعول به لفعل أو حرف جر، أو كصفة ملكية للأنثى.', 'لها / ـها', '["خاصتها", "إياها"]', '{"object": "her", "possessive": "her"}', '/hɜːr/', 'her.mp3', '{"synonyms": [], "antonyms": ["him", "his"], "word_family": ["she", "hers"]}', 'Can be an object pronoun or a possessive determiner.', 'Beginner', 106);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(59, 'I saw {her} at school.', 'رأيتها في المدرسة.', 'her', 'Social', 'Easy', 1, 1),
(59, 'This is {her} book.', 'هذا كتابها.', 'her', 'Possession', 'Easy', 0, 2),
(59, 'Give it to {her}.', 'أعطها إياه.', 'her', 'Giving', 'Easy', 0, 3),
(59, 'I like {her} new car.', 'يعجبني سيارتها الجديدة.', 'her', 'Possession', 'Easy', 0, 4),
(59, 'Tell {her} the truth.', 'قل لها الحقيقة.', 'her', 'Communication', 'Easy', 0, 5),
(59, 'It is {her} turn to play.', 'إنه دورها في اللعب.', 'her', 'Games', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(59, 'translation_match', 'easy', 'her', 'en', 'لها / ـها', 'object', NULL, NULL, NULL, '"her" refers to a female as an object or possessor.'),
(59, 'reverse_translation', 'easy', 'لها / ـها', 'ar', 'her', 'object', NULL, NULL, NULL, 'The Arabic suffix "ـها" or "لها" translates to "her".'),
(59, 'sentence_completion', 'easy', 'I know ___ very well.', 'en', 'her', 'object', 'I know ___ very well.', 'I know her very well.', 2, 'Use "her" as the object pronoun for a female.'),
(59, 'sentence_completion', 'easy', '___ mother is a doctor.', 'en', 'Her', 'possessive', '___ mother is a doctor.', 'Her mother is a doctor.', 0, 'Use "Her" as a possessive determiner.'),
(59, 'sentence_completion', 'easy', 'Please call ___ tonight.', 'en', 'her', 'object', 'Please call ___ tonight.', 'Please call her tonight.', 2, 'Use "her" as the object of the verb "call".'),
(59, 'sentence_completion', 'easy', 'That is ___ house.', 'en', 'her', 'possessive', 'That is ___ house.', 'That is her house.', 2, 'Use "her" to show possession.'),
(59, 'sentence_completion', 'easy', 'I bought a gift for ___.', 'en', 'her', 'object', 'I bought a gift for ___.', 'I bought a gift for her.', 4, 'Use "her" after the preposition "for".'),
(59, 'sentence_completion', 'easy', '___ eyes are blue.', 'en', 'Her', 'possessive', '___ eyes are blue.', 'Her eyes are blue.', 0, 'Use "Her" to describe a feature belonging to her.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(465, 'له'), (465, 'لي'), (465, 'لنا'), (465, 'لهم'), (465, 'لك'), (465, 'هو'), (465, 'هي'), (465, 'أنا'), (465, 'نحن'), (465, 'هم'),
(466, 'him'), (466, 'his'), (466, 'me'), (466, 'my'), (466, 'us'), (466, 'our'), (466, 'them'), (466, 'their'), (466, 'you'), (466, 'your'),
(467, 'him'), (467, 'his'), (467, 'me'), (467, 'my'), (467, 'us'), (467, 'our'), (467, 'them'), (467, 'their'), (467, 'you'), (467, 'your'),
(468, 'Him'), (468, 'His'), (468, 'Me'), (468, 'My'), (468, 'Us'), (468, 'Our'), (468, 'Them'), (468, 'Their'), (468, 'You'), (468, 'Your'),
(469, 'him'), (469, 'his'), (469, 'me'), (469, 'my'), (469, 'us'), (469, 'our'), (469, 'them'), (469, 'their'), (469, 'you'), (469, 'your'),
(470, 'him'), (470, 'his'), (470, 'me'), (470, 'my'), (470, 'us'), (470, 'our'), (470, 'them'), (470, 'their'), (470, 'you'), (470, 'your'),
(471, 'him'), (471, 'his'), (471, 'me'), (471, 'my'), (471, 'us'), (471, 'our'), (471, 'them'), (471, 'their'), (471, 'you'), (471, 'your'),
(472, 'Him'), (472, 'His'), (472, 'Me'), (472, 'My'), (472, 'Us'), (472, 'Our'), (472, 'Them'), (472, 'Their'), (472, 'You'), (472, 'Your');

-- =============================================================================
-- WORD 60: there (ID: 60, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (60, 'there', 'هناك', 'adv.', 'In, at, or to that place or position.', 'في ذلك المكان أو الموقع أو إليه.', 'هناك', '["يوجد"]', '{"base": "there"}', '/ðɛər/', 'there.mp3', '{"synonyms": ["over there"], "antonyms": ["here"], "word_family": []}', 'Often used with "be" to show existence (there is/there are).', 'Beginner', 109);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(60, 'Please sit {there}.', 'من فضلك اجلس هناك.', 'there', 'Instruction', 'Easy', 1, 1),
(60, '{There} is a book on the table.', 'يوجد كتاب على الطاولة.', 'there', 'Existence', 'Easy', 0, 2),
(60, 'I will meet you {there}.', 'سأقابلك هناك.', 'there', 'Social', 'Easy', 0, 3),
(60, '{There} are many people in the park.', 'يوجد الكثير من الناس في الحديقة.', 'there', 'Existence', 'Easy', 0, 4),
(60, 'Look over {there}!', 'انظر هناك!', 'there', 'Direction', 'Easy', 0, 5),
(60, 'Is {there} any water left?', 'هل يوجد أي ماء متبقٍ؟', 'there', 'Needs', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(60, 'translation_match', 'easy', 'there', 'en', 'هناك', 'base', NULL, NULL, NULL, '"there" refers to a location away from the speaker.'),
(60, 'reverse_translation', 'easy', 'هناك', 'ar', 'there', 'base', NULL, NULL, NULL, 'The Arabic "هناك" translates to "there" in English.'),
(60, 'sentence_completion', 'easy', '___ is a cat in the garden.', 'en', 'There', 'base', '___ is a cat in the garden.', 'There is a cat in the garden.', 0, 'Use "There" with "is" to show existence.'),
(60, 'sentence_completion', 'easy', 'Go ___ and wait for me.', 'en', 'there', 'base', 'Go ___ and wait for me.', 'Go there and wait for me.', 1, 'Use "there" to indicate a destination.'),
(60, 'sentence_completion', 'easy', '___ are five apples.', 'en', 'There', 'base', '___ are five apples.', 'There are five apples.', 0, 'Use "There" with "are" for plural existence.'),
(60, 'sentence_completion', 'easy', 'I have been ___ before.', 'en', 'there', 'base', 'I have been ___ before.', 'I have been there before.', 3, 'Use "there" to refer to a place mentioned or known.'),
(60, 'sentence_completion', 'easy', 'Is ___ anyone home?', 'en', 'there', 'base', 'Is ___ anyone home?', 'Is there anyone home?', 1, 'Use "there" in questions about existence.'),
(60, 'sentence_completion', 'easy', 'Put the box over ___.', 'en', 'there', 'base', 'Put the box over ___.', 'Put the box over there.', 4, 'Use "over there" to point to a specific spot.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(473, 'هنا'), (473, 'أين'), (473, 'متى'), (473, 'كيف'), (473, 'من'), (473, 'إلى'), (473, 'في'), (473, 'على'), (473, 'مع'), (473, 'عن'),
(474, 'here'), (474, 'where'), (474, 'when'), (474, 'how'), (474, 'who'), (474, 'this'), (474, 'that'), (474, 'their'), (474, 'they'), (474, 'them'),
(475, 'Their'), (475, 'They'), (475, 'Them'), (475, 'This'), (475, 'That'), (475, 'Here'), (475, 'Where'), (475, 'When'), (475, 'How'), (475, 'Who'),
(476, 'their'), (476, 'they'), (476, 'them'), (476, 'this'), (476, 'that'), (476, 'here'), (476, 'where'), (476, 'when'), (476, 'how'), (476, 'who'),
(477, 'Their'), (477, 'They'), (477, 'Them'), (477, 'This'), (477, 'That'), (477, 'Here'), (477, 'Where'), (477, 'When'), (477, 'How'), (477, 'Who'),
(478, 'their'), (478, 'they'), (478, 'them'), (478, 'this'), (478, 'that'), (478, 'here'), (478, 'where'), (478, 'when'), (478, 'how'), (478, 'who'),
(479, 'their'), (479, 'they'), (479, 'them'), (479, 'this'), (479, 'that'), (479, 'here'), (479, 'where'), (479, 'when'), (479, 'how'), (479, 'who'),
(480, 'their'), (480, 'they'), (480, 'them'), (480, 'this'), (480, 'that'), (480, 'here'), (480, 'where'), (480, 'when'), (480, 'how'), (480, 'who');

-- =============================================================================
-- WORD 61: should (ID: 61, POS: modal v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (61, 'should', 'يجب أن', 'modal v.', 'Used to indicate obligation, duty, or correctness, typically when giving advice.', 'يستخدم للإشارة إلى الالتزام أو الواجب أو الصواب، وعادة ما يكون عند تقديم النصيحة.', 'يجب أن', '["ينبغي"]', '{"base": "should", "negative": "shouldn''t"}', '/ʃʊd/', 'should.mp3', '{"synonyms": ["ought to"], "antonyms": [], "word_family": []}', 'A modal verb that does not change its form for different subjects.', 'Beginner', 110);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(61, 'You {should} eat more vegetables.', 'يجب أن تأكل المزيد من الخضروات.', 'should', 'Advice', 'Easy', 1, 1),
(61, 'We {should} leave now.', 'يجب أن نغادر الآن.', 'should', 'Obligation', 'Easy', 0, 2),
(61, 'He {should} be here soon.', 'ينبغي أن يكون هنا قريباً.', 'should', 'Expectation', 'Easy', 0, 3),
(61, 'You {shouldn''t} smoke.', 'لا ينبغي أن تدخن.', 'shouldn''t', 'Advice', 'Easy', 0, 4),
(61, '{Should} I call him?', 'هل يجب أن أتصل به؟', 'should', 'Inquiry', 'Easy', 0, 5),
(61, 'What {should} we do?', 'ماذا يجب أن نفعل؟', 'should', 'Inquiry', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(61, 'translation_match', 'easy', 'should', 'en', 'يجب أن', 'base', NULL, NULL, NULL, '"should" is used to give advice or express what is right.'),
(61, 'reverse_translation', 'easy', 'يجب أن', 'ar', 'should', 'base', NULL, NULL, NULL, 'The Arabic "يجب أن" (for advice) translates to "should".'),
(61, 'sentence_completion', 'easy', 'You ___ see a doctor.', 'en', 'should', 'base', 'You ___ see a doctor.', 'You should see a doctor.', 1, 'Use "should" to give medical advice.'),
(61, 'sentence_completion', 'easy', 'We ___ not be late.', 'en', 'should', 'base', 'We ___ not be late.', 'We should not be late.', 1, 'Use "should" to express an obligation.'),
(61, 'sentence_completion', 'easy', '___ I open the window?', 'en', 'Should', 'base', '___ I open the window?', 'Should I open the window?', 0, 'Use "Should" to ask for a suggestion.'),
(61, 'sentence_completion', 'easy', 'He ___ study harder.', 'en', 'should', 'base', 'He ___ study harder.', 'He should study harder.', 1, 'Use "should" to give academic advice.'),
(61, 'sentence_completion', 'easy', 'You ___ listen to your parents.', 'en', 'should', 'base', 'You ___ listen to your parents.', 'You should listen to your parents.', 1, 'Use "should" to express a moral duty.'),
(61, 'sentence_completion', 'easy', 'It ___ be a nice day.', 'en', 'should', 'base', 'It ___ be a nice day.', 'It should be a nice day.', 1, 'Use "should" to express an expectation.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(481, 'كان'), (481, 'سوف'), (481, 'استطاع'), (481, 'من'), (481, 'إلى'), (481, 'في'), (481, 'على'), (481, 'مع'), (481, 'عن'), (481, 'بـ'),
(482, 'was'), (482, 'will'), (482, 'could'), (482, 'can'), (482, 'must'), (482, 'would'), (482, 'may'), (482, 'might'), (482, 'has'), (482, 'is'),
(483, 'was'), (483, 'will'), (483, 'could'), (483, 'can'), (483, 'must'), (483, 'would'), (483, 'may'), (483, 'might'), (483, 'has'), (483, 'is'),
(484, 'was'), (484, 'will'), (484, 'could'), (484, 'can'), (484, 'must'), (484, 'would'), (484, 'may'), (484, 'might'), (484, 'has'), (484, 'is'),
(485, 'Was'), (485, 'Will'), (485, 'Could'), (485, 'Can'), (485, 'Must'), (485, 'Would'), (485, 'May'), (485, 'Might'), (485, 'Has'), (485, 'Is'),
(486, 'was'), (486, 'will'), (486, 'could'), (486, 'can'), (486, 'must'), (486, 'would'), (486, 'may'), (486, 'might'), (486, 'has'), (486, 'is'),
(487, 'was'), (487, 'will'), (487, 'could'), (487, 'can'), (487, 'must'), (487, 'would'), (487, 'may'), (487, 'might'), (487, 'has'), (487, 'is'),
(488, 'was'), (488, 'will'), (488, 'could'), (488, 'can'), (488, 'must'), (488, 'would'), (488, 'may'), (488, 'might'), (488, 'has'), (488, 'is');

-- =============================================================================
-- WORD 62: many (ID: 62, POS: det./pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (62, 'many', 'كثير', 'det./pron.', 'A large number of people or things.', 'عدد كبير من الناس أو الأشياء.', 'كثير', '["عديد"]', '{"base": "many"}', '/ˈmɛni/', 'many.mp3', '{"synonyms": ["numerous", "multiple"], "antonyms": ["few"], "word_family": []}', 'Used with countable plural nouns.', 'Beginner', 113);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(62, 'I have {many} friends.', 'لدي الكثير من الأصدقاء.', 'many', 'Social', 'Easy', 1, 1),
(62, 'How {many} books do you have?', 'كم عدد الكتب التي لديك؟', 'many', 'Quantity', 'Easy', 0, 2),
(62, '{Many} people live in this city.', 'كثير من الناس يعيشون في هذه المدينة.', 'many', 'General', 'Easy', 0, 3),
(62, 'There are {many} stars in the sky.', 'هناك الكثير من النجوم في السماء.', 'many', 'Nature', 'Easy', 0, 4),
(62, 'Not {many} students came today.', 'لم يأتِ الكثير من الطلاب اليوم.', 'many', 'Education', 'Easy', 0, 5),
(62, 'I have seen it {many} times.', 'لقد رأيته مرات عديدة.', 'many', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(62, 'translation_match', 'easy', 'many', 'en', 'كثير', 'base', NULL, NULL, NULL, '"many" refers to a large number of countable items.'),
(62, 'reverse_translation', 'easy', 'كثير', 'ar', 'many', 'base', NULL, NULL, NULL, 'The Arabic "كثير" (for countable items) translates to "many".'),
(62, 'sentence_completion', 'easy', 'How ___ apples do you want?', 'en', 'many', 'base', 'How ___ apples do you want?', 'How many apples do you want?', 1, 'Use "many" with countable nouns like "apples" in questions.'),
(62, 'sentence_completion', 'easy', 'There are ___ cars on the road.', 'en', 'many', 'base', 'There are ___ cars on the road.', 'There are many cars on the road.', 2, 'Use "many" to indicate a large number of cars.'),
(62, 'sentence_completion', 'easy', '___ people like to travel.', 'en', 'Many', 'base', '___ people like to travel.', 'Many people like to travel.', 0, 'Use "Many" to refer to a large group of people.'),
(62, 'sentence_completion', 'easy', 'I don''t have ___ pens.', 'en', 'many', 'base', 'I don''t have ___ pens.', 'I don''t have many pens.', 3, 'Use "many" in negative sentences with countable nouns.'),
(62, 'sentence_completion', 'easy', 'Too ___ cooks spoil the soup.', 'en', 'many', 'base', 'Too ___ cooks spoil the soup.', 'Too many cooks spoil the soup.', 1, 'A common proverb using "many".'),
(62, 'sentence_completion', 'easy', 'He has ___ ideas.', 'en', 'many', 'base', 'He has ___ ideas.', 'He has many ideas.', 2, 'Use "many" with the plural noun "ideas".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(489, 'قليل'), (489, 'واحد'), (489, 'بعض'), (489, 'كل'), (489, 'لا شيء'), (489, 'أكثر'), (489, 'أقل'), (489, 'جداً'), (489, 'هنا'), (489, 'هناك'),
(490, 'few'), (490, 'one'), (490, 'some'), (490, 'all'), (490, 'none'), (490, 'more'), (490, 'less'), (490, 'much'), (490, 'little'), (490, 'only'),
(491, 'much'), (491, 'few'), (491, 'little'), (491, 'one'), (491, 'some'), (491, 'all'), (491, 'none'), (491, 'more'), (491, 'less'), (491, 'only'),
(492, 'much'), (492, 'few'), (492, 'little'), (492, 'one'), (492, 'some'), (492, 'all'), (492, 'none'), (492, 'more'), (492, 'less'), (492, 'only'),
(493, 'Much'), (493, 'Few'), (493, 'Little'), (493, 'One'), (493, 'Some'), (493, 'All'), (493, 'None'), (493, 'More'), (493, 'Less'), (493, 'Only'),
(494, 'much'), (494, 'few'), (494, 'little'), (494, 'one'), (494, 'some'), (494, 'all'), (494, 'none'), (494, 'more'), (494, 'less'), (494, 'only'),
(495, 'much'), (495, 'few'), (495, 'little'), (495, 'one'), (495, 'some'), (495, 'all'), (495, 'none'), (495, 'more'), (495, 'less'), (495, 'only'),
(496, 'much'), (496, 'few'), (496, 'little'), (496, 'one'), (496, 'some'), (496, 'all'), (496, 'none'), (496, 'more'), (496, 'less'), (496, 'only');

-- =============================================================================
-- WORD 63: really (ID: 63, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (63, 'really', 'حقاً', 'adv.', 'In actual fact, as opposed to what is said or imagined; or used for emphasis.', 'في الواقع الفعلي، على عكس ما يقال أو يتصور؛ أو يستخدم للتأكيد.', 'حقاً', '["فعلاً", "جداً"]', '{"base": "really"}', '/ˈrɪəli/', 'really.mp3', '{"synonyms": ["actually", "truly", "very"], "antonyms": [], "word_family": ["real"]}', 'Commonly used to emphasize adjectives or to express surprise.', 'Beginner', 114);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(63, 'I {really} like this song.', 'أنا حقاً أحب هذه الأغنية.', 'really', 'Preferences', 'Easy', 1, 1),
(63, 'Is it {really} true?', 'هل هذا حقيقي حقاً؟', 'really', 'Inquiry', 'Easy', 0, 2),
(63, 'It is {really} cold today.', 'الجو بارد جداً اليوم.', 'really', 'Weather', 'Easy', 0, 3),
(63, 'I {really} don''t know.', 'أنا حقاً لا أعرف.', 'really', 'General', 'Easy', 0, 4),
(63, 'She is a {really} nice person.', 'إنها شخص لطيف حقاً.', 'really', 'Personality', 'Easy', 0, 5),
(63, 'Oh, {really}?', 'أوه، حقاً؟', 'really', 'Conversation', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(63, 'translation_match', 'easy', 'really', 'en', 'حقاً', 'base', NULL, NULL, NULL, '"really" is used for emphasis or to confirm truth.'),
(63, 'reverse_translation', 'easy', 'حقاً', 'ar', 'really', 'base', NULL, NULL, NULL, 'The Arabic "حقاً" translates to "really" in English.'),
(63, 'sentence_completion', 'easy', 'I ___ want to go.', 'en', 'really', 'base', 'I ___ want to go.', 'I really want to go.', 1, 'Use "really" to emphasize a desire.'),
(63, 'sentence_completion', 'easy', 'The food was ___ good.', 'en', 'really', 'base', 'The food was ___ good.', 'The food was really good.', 3, 'Use "really" to emphasize an adjective.'),
(63, 'sentence_completion', 'easy', 'Do you ___ think so?', 'en', 'really', 'base', 'Do you ___ think so?', 'Do you really think so?', 2, 'Use "really" to ask for confirmation.'),
(63, 'sentence_completion', 'easy', 'It doesn''t ___ matter.', 'en', 'really', 'base', 'It doesn''t ___ matter.', 'It doesn''t really matter.', 2, 'Use "really" to soften a negative statement.'),
(63, 'sentence_completion', 'easy', 'I am ___ sorry.', 'en', 'really', 'base', 'I am ___ sorry.', 'I am really sorry.', 2, 'Use "really" to show sincere apology.'),
(63, 'sentence_completion', 'easy', 'He is ___ tall.', 'en', 'really', 'base', 'He is ___ tall.', 'He is really tall.', 2, 'Use "really" as a synonym for "very".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(497, 'دائماً'), (497, 'أبداً'), (497, 'هنا'), (497, 'هناك'), (497, 'الآن'), (497, 'فقط'), (497, 'أيضاً'), (497, 'لكن'), (497, 'أو'), (497, 'إذا'),
(498, 'always'), (498, 'never'), (498, 'here'), (498, 'there'), (498, 'now'), (498, 'only'), (498, 'also'), (498, 'but'), (498, 'or'), (498, 'if'),
(499, 'always'), (499, 'never'), (499, 'here'), (499, 'there'), (499, 'now'), (499, 'only'), (499, 'also'), (499, 'but'), (499, 'or'), (499, 'if'),
(500, 'always'), (500, 'never'), (500, 'here'), (500, 'there'), (500, 'now'), (500, 'only'), (500, 'also'), (500, 'but'), (500, 'or'), (500, 'if'),
(501, 'always'), (501, 'never'), (501, 'here'), (501, 'there'), (501, 'now'), (501, 'only'), (501, 'also'), (501, 'but'), (501, 'or'), (501, 'if'),
(502, 'always'), (502, 'never'), (502, 'here'), (502, 'there'), (502, 'now'), (502, 'only'), (502, 'also'), (502, 'but'), (502, 'or'), (502, 'if'),
(503, 'always'), (503, 'never'), (503, 'here'), (503, 'there'), (503, 'now'), (503, 'only'), (503, 'also'), (503, 'but'), (503, 'or'), (503, 'if'),
(504, 'always'), (504, 'never'), (504, 'here'), (504, 'there'), (504, 'now'), (504, 'only'), (504, 'also'), (504, 'but'), (504, 'or'), (504, 'if');

-- =============================================================================
-- WORD 64: life (ID: 64, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (64, 'life', 'حياة', 'n.', 'The condition that distinguishes animals and plants from inorganic matter.', 'الحالة التي تميز الحيوانات والنباتات عن المواد غير العضوية.', 'حياة', '["عيش"]', '{"singular": "life", "plural": "lives"}', '/laɪf/', 'life.mp3', '{"synonyms": ["existence", "living"], "antonyms": ["death"], "word_family": ["live", "lively", "lifeless"]}', 'Plural form is irregular: lives.', 'Beginner', 116);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(64, '{Life} is beautiful.', 'الحياة جميلة.', 'life', 'General', 'Easy', 1, 1),
(64, 'He lived a long {life}.', 'عاش حياة طويلة.', 'life', 'General', 'Easy', 0, 2),
(64, 'I love my {life}.', 'أنا أحب حياتي.', 'life', 'Personal', 'Easy', 0, 3),
(64, 'Many {lives} were saved.', 'تم إنقاذ العديد من الأرواح.', 'lives', 'General', 'Easy', 0, 4),
(64, 'What is the meaning of {life}?', 'ما هو معنى الحياة؟', 'life', 'Philosophy', 'Easy', 0, 5),
(64, 'City {life} is very busy.', 'حياة المدينة مزدحمة جداً.', 'life', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(64, 'translation_match', 'easy', 'life', 'en', 'حياة', 'singular', NULL, NULL, NULL, '"life" refers to the state of being alive.'),
(64, 'reverse_translation', 'easy', 'حياة', 'ar', 'life', 'singular', NULL, NULL, NULL, 'The Arabic "حياة" translates to "life" in English.'),
(64, 'sentence_completion', 'easy', 'Water is essential for ___ .', 'en', 'life', 'singular', 'Water is essential for ___ .', 'Water is essential for life.', 4, 'Use "life" to refer to biological existence.'),
(64, 'sentence_completion', 'easy', 'Cats have nine ___ .', 'en', 'lives', 'plural', 'Cats have nine ___ .', 'Cats have nine lives.', 3, 'Use "lives" as the plural of "life".'),
(64, 'sentence_completion', 'easy', 'I want to change my ___ .', 'en', 'life', 'singular', 'I want to change my ___ .', 'I want to change my life.', 5, 'Use "life" to refer to personal circumstances.'),
(64, 'sentence_completion', 'easy', 'He lost his ___ in the accident.', 'en', 'life', 'singular', 'He lost his ___ in the accident.', 'He lost his life in the accident.', 3, 'Use "life" to mean the state of being alive.'),
(64, 'sentence_completion', 'easy', 'Tell me about your ___ .', 'en', 'life', 'singular', 'Tell me about your ___ .', 'Tell me about your life.', 4, 'Use "life" to refer to someone''s history or experiences.'),
(64, 'sentence_completion', 'easy', 'There is no ___ on Mars.', 'en', 'life', 'singular', 'There is no ___ on Mars.', 'There is no life on Mars.', 3, 'Use "life" to refer to living organisms.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(505, 'موت'), (505, 'وقت'), (505, 'يوم'), (505, 'سنة'), (505, 'ناس'), (505, 'عمل'), (505, 'طريق'), (505, 'هنا'), (505, 'هناك'), (505, 'الآن'),
(506, 'death'), (506, 'time'), (506, 'day'), (506, 'year'), (506, 'people'), (506, 'work'), (506, 'way'), (506, 'here'), (506, 'there'), (506, 'now'),
(507, 'death'), (507, 'time'), (507, 'day'), (507, 'year'), (507, 'people'), (507, 'work'), (507, 'way'), (507, 'here'), (507, 'there'), (507, 'now'),
(508, 'life'), (508, 'death'), (508, 'time'), (508, 'day'), (508, 'year'), (508, 'people'), (508, 'work'), (508, 'way'), (508, 'here'), (508, 'there'),
(509, 'death'), (509, 'time'), (509, 'day'), (509, 'year'), (509, 'people'), (509, 'work'), (509, 'way'), (509, 'here'), (509, 'there'), (509, 'now'),
(510, 'death'), (510, 'time'), (510, 'day'), (510, 'year'), (510, 'people'), (510, 'work'), (510, 'way'), (510, 'here'), (510, 'there'), (510, 'now'),
(511, 'death'), (511, 'time'), (511, 'day'), (511, 'year'), (511, 'people'), (511, 'work'), (511, 'way'), (511, 'here'), (511, 'there'), (511, 'now'),
(512, 'death'), (512, 'time'), (512, 'day'), (512, 'year'), (512, 'people'), (512, 'work'), (512, 'way'), (512, 'here'), (512, 'there'), (512, 'now');

-- =============================================================================
-- WORD 65: why (ID: 65, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (65, 'why', 'لماذا', 'adv.', 'For what reason or purpose.', 'لأي سبب أو غرض.', 'لماذا', '["لم"]', '{"base": "why"}', '/waɪ/', 'why.mp3', '{"synonyms": ["for what reason"], "antonyms": [], "word_family": []}', 'Used to ask about the cause or reason for something.', 'Beginner', 117);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(65, '{Why} are you late?', 'لماذا تأخرت؟', 'why', 'Time', 'Easy', 1, 1),
(65, 'I don''t know {why} she left.', 'لا أعرف لماذا غادرت.', 'why', 'General', 'Easy', 0, 2),
(65, '{Why} did you do that?', 'لماذا فعلت ذلك؟', 'why', 'Inquiry', 'Easy', 0, 3),
(65, 'That is {why} I am here.', 'هذا هو سبب وجودي هنا.', 'why', 'Reason', 'Easy', 0, 4),
(65, '{Why} not go now?', 'لمَ لا نذهب الآن؟', 'why', 'Suggestion', 'Easy', 0, 5),
(65, 'Tell me {why} you are sad.', 'أخبرني لماذا أنت حزين.', 'why', 'Emotion', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(65, 'translation_match', 'easy', 'why', 'en', 'لماذا', 'base', NULL, NULL, NULL, '"why" is used to ask for a reason.'),
(65, 'reverse_translation', 'easy', 'لماذا', 'ar', 'why', 'base', NULL, NULL, NULL, 'The Arabic "لماذا" translates to "why" in English.'),
(65, 'sentence_completion', 'easy', '___ is the sky blue?', 'en', 'Why', 'base', '___ is the sky blue?', 'Why is the sky blue?', 0, 'Use "Why" to ask for a scientific reason.'),
(65, 'sentence_completion', 'easy', 'I wonder ___ he called.', 'en', 'why', 'base', 'I wonder ___ he called.', 'I wonder why he called.', 2, 'Use "why" to express curiosity about a reason.'),
(65, 'sentence_completion', 'easy', '___ don''t you sit down?', 'en', 'Why', 'base', '___ don''t you sit down?', 'Why don''t you sit down?', 0, 'Use "Why don''t you" to make a suggestion.'),
(65, 'sentence_completion', 'easy', '___ are you crying?', 'en', 'Why', 'base', '___ are you crying?', 'Why are you crying?', 0, 'Use "Why" to ask about an emotional state.'),
(65, 'sentence_completion', 'easy', 'He explained ___ he was late.', 'en', 'why', 'base', 'He explained ___ he was late.', 'He explained why he was late.', 2, 'Use "why" to introduce an explanation.'),
(65, 'sentence_completion', 'easy', '___ not try again?', 'en', 'Why', 'base', '___ not try again?', 'Why not try again?', 0, 'Use "Why not" to suggest an alternative.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(513, 'ماذا'), (513, 'متى'), (513, 'أين'), (513, 'كيف'), (513, 'من'), (513, 'أي'), (513, 'كم'), (513, 'هل'), (513, 'الذي'), (513, 'هذا'),
(514, 'what'), (514, 'when'), (514, 'where'), (514, 'how'), (514, 'who'), (514, 'which'), (514, 'how many'), (514, 'whose'), (514, 'that'), (514, 'this'),
(515, 'What'), (515, 'When'), (515, 'Where'), (515, 'How'), (515, 'Who'), (515, 'Which'), (515, 'That'), (515, 'This'), (515, 'It'), (515, 'Whose'),
(516, 'what'), (516, 'when'), (516, 'where'), (516, 'how'), (516, 'who'), (516, 'which'), (516, 'that'), (516, 'this'), (516, 'it'), (516, 'whose'),
(517, 'What'), (517, 'When'), (517, 'Where'), (517, 'How'), (517, 'Who'), (517, 'Which'), (517, 'That'), (517, 'This'), (517, 'It'), (517, 'Whose'),
(518, 'What'), (518, 'When'), (518, 'Where'), (518, 'How'), (518, 'Who'), (518, 'Which'), (518, 'That'), (518, 'This'), (518, 'It'), (518, 'Whose'),
(519, 'what'), (519, 'when'), (519, 'where'), (519, 'how'), (519, 'who'), (519, 'which'), (519, 'that'), (519, 'this'), (519, 'it'), (519, 'whose'),
(520, 'What'), (520, 'When'), (520, 'Where'), (520, 'How'), (520, 'Who'), (520, 'Which'), (520, 'That'), (520, 'This'), (520, 'It'), (520, 'Whose');


-- =============================================================================
-- WORD 66: on (ID: 66, POS: prep., adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (66, 'on', 'على', 'prep., adv.', 'Physically in contact with and supported by a surface; or concerning a topic.', 'ملامس جسدياً لسطح ما ومدعوم به؛ أو بخصوص موضوع ما.', 'على', '["في (للأيام)", "شغال"]', '{"base": "on"}', '/ɒn/', 'on.mp3', '{"synonyms": ["upon", "atop"], "antonyms": ["off", "under"], "word_family": []}', 'Used for surfaces, days of the week, and electronic states.', 'Beginner', 120);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(66, 'The book is {on} the table.', 'الكتاب على الطاولة.', 'on', 'Location', 'Easy', 1, 1),
(66, 'I will see you {on} Monday.', 'سأراك يوم الاثنين.', 'on', 'Time', 'Easy', 0, 2),
(66, 'Turn {on} the light.', 'أشعل الضوء.', 'on', 'Instruction', 'Easy', 0, 3),
(66, 'He is {on} the phone.', 'إنه يتحدث في الهاتف.', 'on', 'Communication', 'Easy', 0, 4),
(66, 'The picture is {on} the wall.', 'الصورة على الحائط.', 'on', 'Home', 'Easy', 0, 5),
(66, 'We are {on} the bus.', 'نحن في الحافلة.', 'on', 'Travel', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(66, 'translation_match', 'easy', 'on', 'en', 'على', 'base', NULL, NULL, NULL, '"on" is the primary preposition for surfaces.'),
(66, 'reverse_translation', 'easy', 'على', 'ar', 'on', 'base', NULL, NULL, NULL, 'The Arabic "على" translates to "on" in English.'),
(66, 'sentence_completion', 'easy', 'Put the cup ___ the desk.', 'en', 'on', 'base', 'Put the cup ___ the desk.', 'Put the cup on the desk.', 3, 'Use "on" for objects on a surface.'),
(66, 'sentence_completion', 'easy', 'My birthday is ___ Friday.', 'en', 'on', 'base', 'My birthday is ___ Friday.', 'My birthday is on Friday.', 3, 'Use "on" before days of the week.'),
(66, 'sentence_completion', 'easy', 'The cat is sitting ___ the floor.', 'en', 'on', 'base', 'The cat is sitting ___ the floor.', 'The cat is sitting on the floor.', 4, 'Use "on" for the floor.'),
(66, 'sentence_completion', 'easy', 'Is the TV ___?', 'en', 'on', 'base', 'Is the TV ___?', 'Is the TV on?', 3, 'Use "on" to indicate a device is working.'),
(66, 'sentence_completion', 'easy', 'He lives ___ Main Street.', 'en', 'on', 'base', 'He lives ___ Main Street.', 'He lives on Main Street.', 2, 'Use "on" for street names in many contexts.'),
(66, 'sentence_completion', 'easy', 'There is a fly ___ the ceiling.', 'en', 'on', 'base', 'There is a fly ___ the ceiling.', 'There is a fly on the ceiling.', 4, 'Use "on" for contact with a surface, even overhead.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(521, 'في'), (521, 'من'), (521, 'إلى'), (521, 'مع'), (521, 'عن'), (521, 'بـ'), (521, 'لـ'), (521, 'تحت'), (521, 'فوق'), (521, 'بين'),
(522, 'in'), (522, 'at'), (522, 'to'), (522, 'from'), (522, 'by'), (522, 'with'), (522, 'under'), (522, 'of'), (522, 'for'), (522, 'about'),
(523, 'in'), (523, 'at'), (523, 'to'), (523, 'from'), (523, 'by'), (523, 'with'), (523, 'under'), (523, 'of'), (523, 'for'), (523, 'about'),
(524, 'in'), (524, 'at'), (524, 'to'), (524, 'from'), (524, 'by'), (524, 'with'), (524, 'under'), (524, 'of'), (524, 'for'), (524, 'about'),
(525, 'in'), (525, 'at'), (525, 'to'), (525, 'from'), (525, 'by'), (525, 'with'), (525, 'under'), (525, 'of'), (525, 'for'), (525, 'about'),
(526, 'in'), (526, 'at'), (526, 'to'), (526, 'from'), (526, 'by'), (526, 'with'), (526, 'under'), (526, 'of'), (526, 'for'), (526, 'about'),
(527, 'in'), (527, 'at'), (527, 'to'), (527, 'from'), (527, 'by'), (527, 'with'), (527, 'under'), (527, 'of'), (527, 'for'), (527, 'about'),
(528, 'in'), (528, 'at'), (528, 'to'), (528, 'from'), (528, 'by'), (528, 'with'), (528, 'under'), (528, 'of'), (528, 'for'), (528, 'about');

-- =============================================================================
-- WORD 67: let (ID: 67, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (67, 'let', 'يدع / يسمح', 'v.', 'To allow someone to do something or to allow something to happen.', 'السماح لشخص ما بفعل شيء ما أو السماح لشيء ما بالحدوث.', 'يدع / يسمح', '["يترك"]', '{"base": "let", "thirdPerson": "lets", "past": "let", "participle": "let", "gerund": "letting"}', '/let/', 'let.mp3', '{"synonyms": ["allow", "permit"], "antonyms": ["forbid", "stop"], "word_family": []}', 'Often used in the phrase "let''s" (let us) for suggestions.', 'Beginner', 122);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(67, '{Let} me help you.', 'دعني أساعدك.', 'let', 'Support', 'Easy', 1, 1),
(67, '{Let''s} go to the park.', 'لنذهب إلى الحديقة.', 'let', 'Social', 'Easy', 0, 2),
(67, 'Please {let} the dog out.', 'من فضلك أخرج الكلب (اسمح له بالخروج).', 'let', 'Animals', 'Easy', 0, 3),
(67, 'He {lets} his children play outside.', 'يسمح لأطفاله باللعب في الخارج.', 'lets', 'Family', 'Easy', 0, 4),
(67, '{Let} it be.', 'ليكن ما يكون.', 'let', 'General', 'Easy', 0, 5),
(67, 'She {let} the secret out.', 'أفشت السر (سمحت للسر بالخروج).', 'let', 'Communication', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(67, 'translation_match', 'easy', 'let', 'en', 'يدع / يسمح', 'base', NULL, NULL, NULL, '"let" is the base verb for allowing or permitting.'),
(67, 'reverse_translation', 'easy', 'يسمح', 'ar', 'let', 'base', NULL, NULL, NULL, 'The Arabic verb "يسمح" translates to "let" in English.'),
(67, 'sentence_completion', 'easy', '___ me go, please.', 'en', 'Let', 'base', '___ me go, please.', 'Let me go, please.', 0, 'Use the base form "Let" for an imperative request.'),
(67, 'sentence_completion', 'easy', '___ eat lunch now.', 'en', 'Let''s', 'base', '___ eat lunch now.', 'Let''s eat lunch now.', 0, 'Use "Let''s" (let us) to make a suggestion.'),
(67, 'sentence_completion', 'easy', 'My father ___ me use his car.', 'en', 'lets', 'thirdPerson', 'My father ___ me use his car.', 'My father lets me use his car.', 2, 'Use "lets" for third-person singular present.'),
(67, 'sentence_completion', 'easy', 'Don''t ___ him do that.', 'en', 'let', 'base', 'Don''t ___ him do that.', 'Don''t let him do that.', 1, 'Use the base form "let" after "don''t".'),
(67, 'sentence_completion', 'easy', 'She ___ the cat into the house.', 'en', 'let', 'past', 'She ___ the cat into the house.', 'She let the cat into the house.', 1, 'The past tense of "let" is also "let".'),
(67, 'sentence_completion', 'easy', '___ us know your decision.', 'en', 'Let', 'base', '___ us know your decision.', 'Let us know your decision.', 0, 'Use "Let" to request information.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(529, 'يمنع'), (529, 'يأخذ'), (529, 'يعطي'), (529, 'يذهب'), (529, 'يأكل'), (529, 'ينام'), (529, 'يرى'), (529, 'يفعل'), (529, 'يقول'), (529, 'يصنع'),
(530, 'stop'), (530, 'take'), (530, 'give'), (530, 'go'), (530, 'eat'), (530, 'sleep'), (530, 'see'), (530, 'do'), (530, 'say'), (530, 'make'),
(531, 'Lets'), (531, 'Letting'), (531, 'Stops'), (531, 'Takes'), (531, 'Gives'), (531, 'Goes'), (531, 'Eats'), (531, 'Sees'), (531, 'Does'), (531, 'Says'),
(532, 'Lets'), (532, 'Letting'), (532, 'Stops'), (532, 'Takes'), (532, 'Gives'), (532, 'Goes'), (532, 'Eats'), (532, 'Sees'), (532, 'Does'), (532, 'Says'),
(533, 'let'), (533, 'letting'), (533, 'stop'), (533, 'stops'), (533, 'take'), (533, 'takes'), (533, 'give'), (533, 'gives'), (533, 'go'), (533, 'goes'),
(534, 'lets'), (534, 'letting'), (534, 'stop'), (534, 'stops'), (534, 'take'), (534, 'takes'), (534, 'give'), (534, 'gives'), (534, 'go'), (534, 'goes'),
(535, 'lets'), (535, 'letting'), (535, 'stop'), (535, 'stops'), (535, 'take'), (535, 'takes'), (535, 'give'), (535, 'gives'), (535, 'go'), (535, 'goes'),
(536, 'Lets'), (536, 'Letting'), (536, 'Stops'), (536, 'Takes'), (536, 'Gives'), (536, 'Goes'), (536, 'Eats'), (536, 'Sees'), (536, 'Does'), (536, 'Says');

-- =============================================================================
-- WORD 68: something (ID: 68, POS: pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (68, 'something', 'شيء ما', 'pron.', 'A thing that is unspecified or unknown.', 'شيء غير محدد أو غير معروف.', 'شيء ما', '["أمر ما"]', '{"base": "something"}', '/ˈsʌmθɪŋ/', 'something.mp3', '{"synonyms": ["a thing"], "antonyms": ["nothing"], "word_family": ["some", "thing"]}', 'Used in positive sentences and requests.', 'Beginner', 123);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(68, 'I need {something} to eat.', 'أحتاج إلى شيء ما لآكله.', 'something', 'Needs', 'Easy', 1, 1),
(68, '{Something} is wrong.', 'هناك شيء ما خطأ.', 'something', 'General', 'Easy', 0, 2),
(68, 'Tell me {something} about yourself.', 'أخبرني بشيء ما عن نفسك.', 'something', 'Social', 'Easy', 0, 3),
(68, 'I have {something} for you.', 'لدي شيء ما لك.', 'something', 'Giving', 'Easy', 0, 4),
(68, 'Let''s do {something} fun.', 'لنقم بشيء ما ممتع.', 'something', 'Social', 'Easy', 0, 5),
(68, 'There is {something} in my eye.', 'هناك شيء ما في عيني.', 'something', 'Health', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(68, 'translation_match', 'easy', 'something', 'en', 'شيء ما', 'base', NULL, NULL, NULL, '"something" refers to an unspecified object or idea.'),
(68, 'reverse_translation', 'easy', 'شيء ما', 'ar', 'something', 'base', NULL, NULL, NULL, 'The Arabic "شيء ما" translates to "something" in English.'),
(68, 'sentence_completion', 'easy', 'I want to buy ___ .', 'en', 'something', 'base', 'I want to buy ___ .', 'I want to buy something.', 4, 'Use "something" to refer to an unspecified item.'),
(68, 'sentence_completion', 'easy', '___ smells good.', 'en', 'Something', 'base', '___ smells good.', 'Something smells good.', 0, 'Use "Something" as the subject for an unknown thing.'),
(68, 'sentence_completion', 'easy', 'Give me ___ to drink.', 'en', 'something', 'base', 'Give me ___ to drink.', 'Give me something to drink.', 2, 'Use "something" to request an unspecified item.'),
(68, 'sentence_completion', 'easy', 'He said ___ to me.', 'en', 'something', 'base', 'He said ___ to me.', 'He said something to me.', 2, 'Use "something" to refer to an unspecified statement.'),
(68, 'sentence_completion', 'easy', 'Is ___ bothering you?', 'en', 'something', 'base', 'Is ___ bothering you?', 'Is something bothering you?', 1, 'Use "something" in a question about an unknown cause.'),
(68, 'sentence_completion', 'easy', 'I forgot ___ .', 'en', 'something', 'base', 'I forgot ___ .', 'I forgot something.', 2, 'Use "something" to refer to an unspecified forgotten item.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(537, 'لا شيء'), (537, 'كل شيء'), (537, 'أي شيء'), (537, 'شخص ما'), (537, 'مكان ما'), (537, 'أين'), (537, 'متى'), (537, 'كيف'), (537, 'من'), (537, 'ماذا'),
(538, 'nothing'), (538, 'everything'), (538, 'anything'), (538, 'someone'), (538, 'somewhere'), (538, 'where'), (538, 'when'), (538, 'how'), (538, 'who'), (538, 'what'),
(539, 'nothing'), (539, 'everything'), (539, 'anything'), (539, 'someone'), (539, 'somewhere'), (539, 'where'), (539, 'when'), (539, 'how'), (539, 'who'), (539, 'what'),
(540, 'Nothing'), (540, 'Everything'), (540, 'Anything'), (540, 'Someone'), (540, 'Somewhere'), (540, 'Where'), (540, 'When'), (540, 'How'), (540, 'Who'), (540, 'What'),
(541, 'nothing'), (541, 'everything'), (541, 'anything'), (541, 'someone'), (541, 'somewhere'), (541, 'where'), (541, 'when'), (541, 'how'), (541, 'who'), (541, 'what'),
(542, 'nothing'), (542, 'everything'), (542, 'anything'), (542, 'someone'), (542, 'somewhere'), (542, 'where'), (542, 'when'), (542, 'how'), (542, 'who'), (542, 'what'),
(543, 'nothing'), (543, 'everything'), (543, 'anything'), (543, 'someone'), (543, 'somewhere'), (543, 'where'), (543, 'when'), (543, 'how'), (543, 'who'), (543, 'what'),
(544, 'nothing'), (544, 'everything'), (544, 'anything'), (544, 'someone'), (544, 'somewhere'), (544, 'where'), (544, 'when'), (544, 'how'), (544, 'who'), (544, 'what');

-- =============================================================================
-- WORD 69: too (ID: 69, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (69, 'too', 'جداً / أيضاً', 'adv.', 'To a higher degree than is desirable; or in addition; also.', 'بدرجة أعلى مما هو مرغوب فيه؛ أو بالإضافة إلى ذلك؛ أيضاً.', 'جداً / أيضاً', '["كذلك"]', '{"base": "too"}', '/tuː/', 'too.mp3', '{"synonyms": ["also", "excessively"], "antonyms": [], "word_family": []}', 'Can mean "also" (at the end of a sentence) or "excessively" (before an adjective).', 'Beginner', 124);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(69, 'This tea is {too} hot.', 'هذا الشاي ساخن جداً.', 'too', 'Food', 'Easy', 1, 1),
(69, 'I like coffee {too}.', 'أنا أحب القهوة أيضاً.', 'too', 'Preferences', 'Easy', 0, 2),
(69, 'It is {too} late to go out.', 'الوقت متأخر جداً للخروج.', 'too', 'Time', 'Easy', 0, 3),
(69, 'Me {too}!', 'أنا أيضاً!', 'too', 'Social', 'Easy', 0, 4),
(69, 'There are {too} many people.', 'هناك الكثير جداً من الناس.', 'too', 'Quantity', 'Easy', 0, 5),
(69, 'He is {too} tired to work.', 'إنه متعب جداً لدرجة أنه لا يستطيع العمل.', 'too', 'State', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(69, 'translation_match', 'easy', 'too', 'en', 'جداً / أيضاً', 'base', NULL, NULL, NULL, '"too" can mean "also" or "excessively".'),
(69, 'reverse_translation', 'easy', 'أيضاً', 'ar', 'too', 'base', NULL, NULL, NULL, 'The Arabic "أيضاً" translates to "too" in English.'),
(69, 'sentence_completion', 'easy', 'The water is ___ cold.', 'en', 'too', 'base', 'The water is ___ cold.', 'The water is too cold.', 3, 'Use "too" before an adjective to mean "excessively".'),
(69, 'sentence_completion', 'easy', 'Nice to meet you ___ .', 'en', 'too', 'base', 'Nice to meet you ___ .', 'Nice to meet you too.', 4, 'Use "too" at the end of a sentence to mean "also".'),
(69, 'sentence_completion', 'easy', 'He is ___ young to drive.', 'en', 'too', 'base', 'He is ___ young to drive.', 'He is too young to drive.', 2, 'Use "too" to show that a condition prevents an action.'),
(69, 'sentence_completion', 'easy', 'I want some cake ___ .', 'en', 'too', 'base', 'I want some cake ___ .', 'I want some cake too.', 4, 'Use "too" to mean "as well".'),
(69, 'sentence_completion', 'easy', 'It costs ___ much.', 'en', 'too', 'base', 'It costs ___ much.', 'It costs too much.', 2, 'Use "too" with "much" to indicate an excessive price.'),
(69, 'sentence_completion', 'easy', 'Are you coming ___ ?', 'en', 'too', 'base', 'Are you coming ___ ?', 'Are you coming too?', 3, 'Use "too" to ask if someone is joining.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(545, 'فقط'), (545, 'جداً (فقط)'), (545, 'لكن'), (545, 'أو'), (545, 'إذا'), (545, 'من'), (545, 'إلى'), (545, 'في'), (545, 'على'), (545, 'مع'),
(546, 'two'), (546, 'to'), (546, 'very'), (546, 'so'), (546, 'only'), (546, 'also'), (546, 'but'), (546, 'or'), (546, 'if'), (546, 'from'),
(547, 'two'), (547, 'to'), (547, 'very'), (547, 'so'), (547, 'only'), (547, 'also'), (547, 'but'), (547, 'or'), (547, 'if'), (547, 'from'),
(548, 'two'), (548, 'to'), (548, 'very'), (548, 'so'), (548, 'only'), (548, 'also'), (548, 'but'), (548, 'or'), (548, 'if'), (548, 'from'),
(549, 'two'), (549, 'to'), (549, 'very'), (549, 'so'), (549, 'only'), (549, 'also'), (549, 'but'), (549, 'or'), (549, 'if'), (549, 'from'),
(550, 'two'), (550, 'to'), (550, 'very'), (550, 'so'), (550, 'only'), (550, 'also'), (550, 'but'), (550, 'or'), (550, 'if'), (550, 'from'),
(551, 'two'), (551, 'to'), (551, 'very'), (551, 'so'), (551, 'only'), (551, 'also'), (551, 'but'), (551, 'or'), (551, 'if'), (551, 'from'),
(552, 'two'), (552, 'to'), (552, 'very'), (552, 'so'), (552, 'only'), (552, 'also'), (552, 'but'), (552, 'or'), (552, 'if'), (552, 'from');

-- =============================================================================
-- WORD 70: woman (ID: 70, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (70, 'woman', 'امرأة', 'n.', 'An adult female human being.', 'إنسانة أنثى بالغة.', 'امرأة', '["سيدة"]', '{"singular": "woman", "plural": "women"}', '/ˈwʊmən/', 'woman.mp3', '{"synonyms": ["female", "lady"], "antonyms": ["man"], "word_family": ["womanly"]}', 'Plural form is irregular: women.', 'Beginner', 126);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(70, 'She is a very kind {woman}.', 'إنها امرأة طيبة جداً.', 'woman', 'Personality', 'Easy', 1, 1),
(70, 'I saw a {woman} in the park.', 'رأيت امرأة في الحديقة.', 'woman', 'General', 'Easy', 0, 2),
(70, 'The {women} are working together.', 'النساء يعملن معاً.', 'women', 'Work', 'Easy', 0, 3),
(70, 'Who is that {woman}?', 'من تلك المرأة؟', 'woman', 'Identity', 'Easy', 0, 4),
(70, 'A young {woman} helped me.', 'ساعدتني امرأة شابة.', 'woman', 'Social', 'Easy', 0, 5),
(70, 'She is a strong {woman}.', 'إنها امرأة قوية.', 'woman', 'Personality', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(70, 'translation_match', 'easy', 'woman', 'en', 'امرأة', 'singular', NULL, NULL, NULL, '"woman" refers to an adult female human.'),
(70, 'reverse_translation', 'easy', 'امرأة', 'ar', 'woman', 'singular', NULL, NULL, NULL, 'The Arabic "امرأة" translates to "woman" in English.'),
(70, 'sentence_completion', 'easy', 'That ___ is my mother.', 'en', 'woman', 'singular', 'That ___ is my mother.', 'That woman is my mother.', 1, 'Use "woman" for a single adult female.'),
(70, 'sentence_completion', 'easy', 'Three ___ are standing there.', 'en', 'women', 'plural', 'Three ___ are standing there.', 'Three women are standing there.', 1, 'Use "women" as the irregular plural of "woman".'),
(70, 'sentence_completion', 'easy', 'She is a good ___ .', 'en', 'woman', 'singular', 'She is a good ___ .', 'She is a good woman.', 4, 'Use "woman" to describe an individual female.'),
(70, 'sentence_completion', 'easy', 'The man and the ___ are friends.', 'en', 'woman', 'singular', 'The man and the ___ are friends.', 'The man and the woman are friends.', 4, 'Use "woman" as the counterpart to "man".'),
(70, 'sentence_completion', 'easy', 'Many ___ work in this office.', 'en', 'women', 'plural', 'Many ___ work in this office.', 'Many women work in this office.', 1, 'Use "women" for a plural group of females.'),
(70, 'sentence_completion', 'easy', 'Is she a young ___?', 'en', 'woman', 'singular', 'Is she a young ___?', 'Is she a young woman?', 4, 'Use "woman" to refer to an adult female.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(553, 'رجل'), (553, 'طفل'), (553, 'بنت'), (553, 'ولد'), (553, 'حيوان'), (553, 'شيء'), (553, 'مكان'), (553, 'وقت'), (553, 'يوم'), (553, 'سنة'),
(554, 'man'), (554, 'child'), (554, 'girl'), (554, 'boy'), (554, 'animal'), (554, 'thing'), (554, 'place'), (554, 'time'), (554, 'day'), (554, 'year'),
(555, 'man'), (555, 'men'), (555, 'boy'), (555, 'girl'), (555, 'child'), (555, 'person'), (555, 'people'), (555, 'animal'), (555, 'thing'), (555, 'place'),
(556, 'woman'), (556, 'man'), (556, 'men'), (556, 'boy'), (556, 'boys'), (556, 'girl'), (556, 'girls'), (556, 'child'), (556, 'children'), (556, 'person'),
(557, 'women'), (557, 'man'), (557, 'girl'), (557, 'boy'), (557, 'child'), (557, 'person'), (557, 'people'), (557, 'animal'), (557, 'thing'), (557, 'place'),
(558, 'women'), (558, 'man'), (558, 'girl'), (558, 'boy'), (558, 'child'), (558, 'person'), (558, 'people'), (558, 'animal'), (558, 'thing'), (558, 'place'),
(559, 'woman'), (559, 'man'), (559, 'men'), (559, 'boy'), (559, 'boys'), (559, 'girl'), (559, 'girls'), (559, 'child'), (559, 'children'), (559, 'person'),
(560, 'women'), (560, 'man'), (560, 'girl'), (560, 'boy'), (560, 'child'), (560, 'person'), (560, 'people'), (560, 'animal'), (560, 'thing'), (560, 'place');

-- =============================================================================
-- WORD 71: never (ID: 71, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (71, 'never', 'أبداً', 'adv.', 'At no time in the past or future.', 'في أي وقت في الماضي أو المستقبل (مطلقاً).', 'أبداً', '["مطلقاً"]', '{"base": "never"}', '/ˈnevər/', 'never.mp3', '{"synonyms": ["not ever"], "antonyms": ["always", "forever"], "word_family": []}', 'Used to indicate that an action does not happen at any time.', 'Beginner', 132);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(71, 'I {never} eat meat.', 'أنا لا آكل اللحم أبداً.', 'never', 'Preferences', 'Easy', 1, 1),
(71, '{Never} say never.', 'لا تقل أبداً "مستحيل".', 'never', 'Proverb', 'Easy', 0, 2),
(71, 'He is {never} late for work.', 'هو لا يتأخر أبداً عن العمل.', 'never', 'Routine', 'Easy', 0, 3),
(71, 'I have {never} been to Paris.', 'لم أزر باريس أبداً.', 'never', 'Travel', 'Easy', 0, 4),
(71, 'She {never} listens to me.', 'هي لا تستمع إلي أبداً.', 'never', 'Social', 'Easy', 0, 5),
(71, 'Better late than {never}.', 'أن تأتي متأخراً خير من ألا تأتي أبداً.', 'never', 'Proverb', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(71, 'translation_match', 'easy', 'never', 'en', 'أبداً', 'base', NULL, NULL, NULL, '"never" means at no time.'),
(71, 'reverse_translation', 'easy', 'أبداً', 'ar', 'never', 'base', NULL, NULL, NULL, 'The Arabic "أبداً" translates to "never" in English.'),
(71, 'sentence_completion', 'easy', 'I ___ drink coffee at night.', 'en', 'never', 'base', 'I ___ drink coffee at night.', 'I never drink coffee at night.', 1, 'Use "never" to show that an action happens zero times.'),
(71, 'sentence_completion', 'easy', 'He has ___ seen snow.', 'en', 'never', 'base', 'He has ___ seen snow.', 'He has never seen snow.', 2, 'Use "never" with the present perfect to show lack of experience.'),
(71, 'sentence_completion', 'easy', '___ give up on your dreams.', 'en', 'Never', 'base', '___ give up on your dreams.', 'Never give up on your dreams.', 0, 'Use "Never" to start a strong negative command.'),
(71, 'sentence_completion', 'easy', 'It is ___ too late to learn.', 'en', 'never', 'base', 'It is ___ too late to learn.', 'It is never too late to learn.', 2, 'Use "never" to emphasize that something is always possible.'),
(71, 'sentence_completion', 'easy', 'I will ___ forget you.', 'en', 'never', 'base', 'I will ___ forget you.', 'I will never forget you.', 2, 'Use "never" to show a future promise of zero occurrence.'),
(71, 'sentence_completion', 'easy', 'She ___ smiles at me.', 'en', 'never', 'base', 'She ___ smiles at me.', 'She never smiles at me.', 1, 'Use "never" to describe a consistent lack of action.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(561, 'دائماً'), (561, 'أحياناً'), (561, 'غالباً'), (561, 'الآن'), (561, 'هنا'), (561, 'هناك'), (561, 'فقط'), (561, 'أيضاً'), (561, 'جداً'), (561, 'ربما'),
(562, 'always'), (562, 'sometimes'), (562, 'often'), (562, 'usually'), (562, 'now'), (562, 'here'), (562, 'there'), (562, 'only'), (562, 'also'), (562, 'maybe'),
(563, 'always'), (563, 'sometimes'), (563, 'often'), (563, 'usually'), (563, 'now'), (563, 'here'), (563, 'there'), (563, 'only'), (563, 'also'), (563, 'maybe'),
(564, 'always'), (564, 'sometimes'), (564, 'often'), (564, 'usually'), (564, 'now'), (564, 'here'), (564, 'there'), (564, 'only'), (564, 'also'), (564, 'maybe'),
(565, 'Always'), (565, 'Sometimes'), (565, 'Often'), (565, 'Usually'), (565, 'Now'), (565, 'Here'), (565, 'There'), (565, 'Only'), (565, 'Also'), (565, 'Maybe'),
(566, 'always'), (566, 'sometimes'), (566, 'often'), (566, 'usually'), (566, 'now'), (566, 'here'), (566, 'there'), (566, 'only'), (566, 'also'), (566, 'maybe'),
(567, 'always'), (567, 'sometimes'), (567, 'often'), (567, 'usually'), (567, 'now'), (567, 'here'), (567, 'there'), (567, 'only'), (567, 'also'), (567, 'maybe'),
(568, 'always'), (568, 'sometimes'), (568, 'often'), (568, 'usually'), (568, 'now'), (568, 'here'), (568, 'there'), (568, 'only'), (568, 'also'), (568, 'maybe');

-- =============================================================================
-- WORD 72: world (ID: 72, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (72, 'world', 'عالم', 'n.', 'The earth, together with all of its countries and peoples.', 'الأرض، جنباً إلى جنب مع جميع بلدانها وشعوبها.', 'عالم', '["دنيا"]', '{"singular": "world", "plural": "worlds"}', '/wɜːrld/', 'world.mp3', '{"synonyms": ["earth", "globe", "planet"], "antonyms": [], "word_family": ["worldwide"]}', 'Refers to the planet or a specific sphere of activity.', 'Beginner', 134);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(72, 'The {world} is a big place.', 'العالم مكان كبير.', 'world', 'General', 'Easy', 1, 1),
(72, 'I want to travel around the {world}.', 'أريد السفر حول العالم.', 'world', 'Travel', 'Easy', 0, 2),
(72, 'He is the best player in the {world}.', 'هو أفضل لاعب في العالم.', 'world', 'Sports', 'Easy', 0, 3),
(72, 'There are many languages in the {world}.', 'هناك لغات كثيرة في العالم.', 'world', 'General', 'Easy', 0, 4),
(72, 'The {world} is changing fast.', 'العالم يتغير بسرعة.', 'world', 'General', 'Easy', 0, 5),
(72, 'Welcome to my {world}.', 'مرحباً بك في عالمي.', 'world', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(72, 'translation_match', 'easy', 'world', 'en', 'عالم', 'singular', NULL, NULL, NULL, '"world" refers to our planet and everything on it.'),
(72, 'reverse_translation', 'easy', 'عالم', 'ar', 'world', 'singular', NULL, NULL, NULL, 'The Arabic "عالم" translates to "world" in English.'),
(72, 'sentence_completion', 'easy', 'The ___ is round.', 'en', 'world', 'singular', 'The ___ is round.', 'The world is round.', 1, 'Use "world" to refer to the planet Earth.'),
(72, 'sentence_completion', 'easy', 'She is the richest woman in the ___ .', 'en', 'world', 'singular', 'She is the richest woman in the ___ .', 'She is the richest woman in the world.', 7, 'Use "world" to indicate a global scope.'),
(72, 'sentence_completion', 'easy', 'Peace in the ___ .', 'en', 'world', 'singular', 'Peace in the ___ .', 'Peace in the world.', 3, 'Use "world" to refer to global human society.'),
(72, 'sentence_completion', 'easy', 'A map of the ___ .', 'en', 'world', 'singular', 'A map of the ___ .', 'A map of the world.', 4, 'Use "world" to describe a map of all continents.'),
(72, 'sentence_completion', 'easy', 'There are billions of people in the ___ .', 'en', 'world', 'singular', 'There are billions of people in the ___ .', 'There are billions of people in the world.', 8, 'Use "world" to refer to the entire human population location.'),
(72, 'sentence_completion', 'easy', 'It is a small ___ .', 'en', 'world', 'singular', 'It is a small ___ .', 'It is a small world.', 4, 'Common idiom used when meeting someone unexpectedly.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(569, 'بلد'), (569, 'مدينة'), (569, 'سماء'), (569, 'بحر'), (569, 'قمر'), (569, 'شمس'), (569, 'وقت'), (569, 'يوم'), (569, 'ناس'), (569, 'عمل'),
(570, 'country'), (570, 'city'), (570, 'sky'), (570, 'sea'), (570, 'moon'), (570, 'sun'), (570, 'time'), (570, 'day'), (570, 'people'), (570, 'work'),
(571, 'country'), (571, 'city'), (571, 'sky'), (571, 'sea'), (571, 'moon'), (571, 'sun'), (571, 'time'), (571, 'day'), (571, 'people'), (571, 'work'),
(572, 'country'), (572, 'city'), (572, 'sky'), (572, 'sea'), (572, 'moon'), (572, 'sun'), (572, 'time'), (572, 'day'), (572, 'people'), (572, 'work'),
(573, 'country'), (573, 'city'), (573, 'sky'), (573, 'sea'), (573, 'moon'), (573, 'sun'), (573, 'time'), (573, 'day'), (573, 'people'), (573, 'work'),
(574, 'country'), (574, 'city'), (574, 'sky'), (574, 'sea'), (574, 'moon'), (574, 'sun'), (574, 'time'), (574, 'day'), (574, 'people'), (574, 'work'),
(575, 'country'), (575, 'city'), (575, 'sky'), (575, 'sea'), (575, 'moon'), (575, 'sun'), (575, 'time'), (575, 'day'), (575, 'people'), (575, 'work'),
(576, 'country'), (576, 'city'), (576, 'sky'), (576, 'sea'), (576, 'moon'), (576, 'sun'), (576, 'time'), (576, 'day'), (576, 'people'), (576, 'work');

-- =============================================================================
-- WORD 73: yeah (ID: 73, POS: exclam.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (73, 'yeah', 'نعم (عامية)', 'exclam.', 'Informal form of "yes".', 'صيغة غير رسمية لكلمة "نعم".', 'نعم (عامية)', '["أجل", "إيه"]', '{"base": "yeah"}', '/jeə/', 'yeah.mp3', '{"synonyms": ["yes", "yep"], "antonyms": ["no", "nope"], "word_family": []}', 'Very common in spoken English, but avoid in formal writing.', 'Beginner', 137);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(73, '{Yeah}, I think so.', 'نعم، أعتقد ذلك.', 'yeah', 'Conversation', 'Easy', 1, 1),
(73, 'Are you coming? - {Yeah}.', 'هل أنت قادم؟ - نعم.', 'yeah', 'Conversation', 'Easy', 0, 2),
(73, 'Oh {yeah}? Prove it.', 'أحقاً؟ أثبت ذلك.', 'yeah', 'Conversation', 'Easy', 0, 3),
(73, '{Yeah}, that sounds great.', 'أجل، هذا يبدو رائعاً.', 'yeah', 'Agreement', 'Easy', 0, 4),
(73, 'He said {yeah} to the plan.', 'قال نعم للخطة.', 'yeah', 'Social', 'Easy', 0, 5),
(73, '{Yeah}, I know what you mean.', 'أجل، أعرف ما تقصده.', 'yeah', 'Agreement', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(73, 'translation_match', 'easy', 'yeah', 'en', 'نعم (عامية)', 'base', NULL, NULL, NULL, '"yeah" is an informal way to say yes.'),
(73, 'reverse_translation', 'easy', 'نعم (عامية)', 'ar', 'yeah', 'base', NULL, NULL, NULL, 'The informal Arabic "نعم" or "أجل" translates to "yeah".'),
(73, 'sentence_completion', 'easy', '___, that is right.', 'en', 'Yeah', 'base', '___, that is right.', 'Yeah, that is right.', 0, 'Use "Yeah" as an informal agreement.'),
(73, 'sentence_completion', 'easy', 'Did you see him? - ___ .', 'en', 'Yeah', 'base', 'Did you see him? - ___ .', 'Did you see him? - Yeah.', 5, 'Use "Yeah" to answer a question affirmatively in a casual way.'),
(73, 'sentence_completion', 'easy', 'Oh ___? I don''t believe you.', 'en', 'yeah', 'base', 'Oh ___? I don''t believe you.', 'Oh yeah? I don''t believe you.', 1, 'Use "Oh yeah?" to express doubt or challenge.'),
(73, 'sentence_completion', 'easy', '___, I''ll be there.', 'en', 'Yeah', 'base', '___, I''ll be there.', 'Yeah, I''ll be there.', 0, 'Use "Yeah" to confirm a plan informally.'),
(73, 'sentence_completion', 'easy', 'Hell ___, let''s go!', 'en', 'yeah', 'base', 'Hell ___, let''s go!', 'Hell yeah, let''s go!', 1, 'Slang expression showing strong excitement/agreement.'),
(73, 'sentence_completion', 'easy', '___, whatever you say.', 'en', 'Yeah', 'base', '___, whatever you say.', 'Yeah, whatever you say.', 0, 'Use "Yeah" to show casual agreement.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(577, 'لا'), (577, 'كلا'), (577, 'ربما'), (577, 'أبداً'), (577, 'هنا'), (577, 'هناك'), (577, 'شكراً'), (577, 'عفواً'), (577, 'من'), (577, 'إلى'),
(578, 'no'), (578, 'nope'), (578, 'maybe'), (578, 'never'), (578, 'not'), (578, 'here'), (578, 'there'), (578, 'thanks'), (578, 'please'), (578, 'sorry'),
(579, 'No'), (579, 'Nope'), (579, 'Maybe'), (579, 'Never'), (579, 'Not'), (579, 'Here'), (579, 'There'), (579, 'Thanks'), (579, 'Please'), (579, 'Sorry'),
(580, 'No'), (580, 'Nope'), (580, 'Maybe'), (580, 'Never'), (580, 'Not'), (580, 'Here'), (580, 'There'), (580, 'Thanks'), (580, 'Please'), (580, 'Sorry'),
(581, 'no'), (581, 'nope'), (581, 'maybe'), (581, 'never'), (581, 'not'), (581, 'here'), (581, 'there'), (581, 'thanks'), (581, 'please'), (581, 'sorry'),
(582, 'No'), (582, 'Nope'), (582, 'Maybe'), (582, 'Never'), (582, 'Not'), (582, 'Here'), (582, 'There'), (582, 'Thanks'), (582, 'Please'), (582, 'Sorry'),
(583, 'no'), (583, 'nope'), (583, 'maybe'), (583, 'never'), (583, 'not'), (583, 'here'), (583, 'there'), (583, 'thanks'), (583, 'please'), (583, 'sorry'),
(584, 'No'), (584, 'Nope'), (584, 'Maybe'), (584, 'Never'), (584, 'Not'), (584, 'Here'), (584, 'There'), (584, 'Thanks'), (584, 'Please'), (584, 'Sorry');

-- =============================================================================
-- WORD 74: great (ID: 74, POS: adj.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (74, 'great', 'عظيم', 'adj.', 'Of an extent, amount, or intensity considerably above the normal or average.', 'بدرجة أو كمية أو شدة أعلى بكثير من الطبيعي أو المتوسط.', 'عظيم', '["رائع", "كبير"]', '{"base": "great", "comparative": "greater", "superlative": "greatest"}', '/ɡreɪt/', 'great.mp3', '{"synonyms": ["excellent", "wonderful", "big"], "antonyms": ["small", "terrible", "poor"], "word_family": ["greatly", "greatness"]}', 'Can mean "very good" or "very large".', 'Beginner', 138);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(74, 'You did a {great} job.', 'لقد قمت بعمل عظيم.', 'great', 'Work', 'Easy', 1, 1),
(74, 'It is a {great} day for a walk.', 'إنه يوم رائع للمشي.', 'great', 'Weather', 'Easy', 0, 2),
(74, 'He is a {great} leader.', 'إنه قائد عظيم.', 'great', 'Personality', 'Easy', 0, 3),
(74, 'The {greatest} thing is to be happy.', 'أعظم شيء هو أن تكون سعيداً.', 'greatest', 'Philosophy', 'Easy', 0, 4),
(74, 'A {great} number of people came.', 'جاء عدد كبير من الناس.', 'great', 'Quantity', 'Easy', 0, 5),
(74, 'That sounds {great}!', 'هذا يبدو رائعاً!', 'great', 'Agreement', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(74, 'translation_match', 'easy', 'great', 'en', 'عظيم', 'base', NULL, NULL, NULL, '"great" means excellent or very large.'),
(74, 'reverse_translation', 'easy', 'عظيم', 'ar', 'great', 'base', NULL, NULL, NULL, 'The Arabic "عظيم" translates to "great" in English.'),
(74, 'sentence_completion', 'easy', 'Have a ___ time!', 'en', 'great', 'base', 'Have a ___ time!', 'Have a great time!', 2, 'Use "great" to wish someone an excellent experience.'),
(74, 'sentence_completion', 'easy', 'This is a ___ idea.', 'en', 'great', 'base', 'This is a ___ idea.', 'This is a great idea.', 3, 'Use "great" to praise a suggestion.'),
(74, 'sentence_completion', 'easy', 'He is the ___ player ever.', 'en', 'greatest', 'superlative', 'He is the ___ player ever.', 'He is the greatest player ever.', 4, 'Use "greatest" to indicate the highest rank.'),
(74, 'sentence_completion', 'easy', 'A ___ wall was built.', 'en', 'great', 'base', 'A ___ wall was built.', 'A great wall was built.', 1, 'Use "great" to mean very large or grand.'),
(74, 'sentence_completion', 'easy', 'I feel ___ today.', 'en', 'great', 'base', 'I feel ___ today.', 'I feel great today.', 2, 'Use "great" to describe feeling very good.'),
(74, 'sentence_completion', 'easy', 'The ___ majority of people agreed.', 'en', 'great', 'base', 'The ___ majority of people agreed.', 'The great majority of people agreed.', 1, 'Use "great" to emphasize a large majority.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(585, 'صغير'), (585, 'سيء'), (585, 'قليل'), (585, 'بارد'), (585, 'حزين'), (585, 'هنا'), (585, 'هناك'), (585, 'الآن'), (585, 'أبداً'), (585, 'دائماً'),
(586, 'small'), (586, 'bad'), (586, 'terrible'), (586, 'poor'), (586, 'little'), (586, 'cold'), (586, 'sad'), (586, 'here'), (586, 'now'), (586, 'never'),
(587, 'small'), (587, 'bad'), (587, 'terrible'), (587, 'poor'), (587, 'little'), (587, 'cold'), (587, 'sad'), (587, 'here'), (587, 'now'), (587, 'never'),
(588, 'small'), (588, 'bad'), (588, 'terrible'), (588, 'poor'), (588, 'little'), (588, 'cold'), (588, 'sad'), (588, 'here'), (588, 'now'), (588, 'never'),
(589, 'great'), (589, 'greater'), (589, 'small'), (589, 'smaller'), (589, 'smallest'), (589, 'bad'), (589, 'worse'), (589, 'worst'), (589, 'good'), (589, 'best'),
(590, 'small'), (590, 'bad'), (590, 'terrible'), (590, 'poor'), (590, 'little'), (590, 'cold'), (590, 'sad'), (590, 'here'), (590, 'now'), (590, 'never'),
(591, 'small'), (591, 'bad'), (591, 'terrible'), (591, 'poor'), (591, 'little'), (591, 'cold'), (591, 'sad'), (591, 'here'), (591, 'now'), (591, 'never'),
(592, 'small'), (592, 'bad'), (592, 'terrible'), (592, 'poor'), (592, 'little'), (592, 'cold'), (592, 'sad'), (592, 'here'), (592, 'now'), (592, 'never');

-- =============================================================================
-- WORD 75: child (ID: 75, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (75, 'child', 'طفل', 'n.', 'A young human being below the age of puberty.', 'إنسان صغير دون سن البلوغ.', 'طفل', '["ابن", "ابنة"]', '{"singular": "child", "plural": "children"}', '/tʃaɪld/', 'child.mp3', '{"synonyms": ["kid", "infant"], "antonyms": ["adult", "parent"], "word_family": ["childhood", "childish"]}', 'Plural form is irregular: children.', 'Beginner', 140);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(75, 'The {child} is playing with a ball.', 'الطفل يلعب بالكرة.', 'child', 'General', 'Easy', 1, 1),
(75, 'I have two {children}.', 'لي طفلان.', 'children', 'Family', 'Easy', 0, 2),
(75, 'Every {child} needs love.', 'كل طفل يحتاج إلى الحب.', 'child', 'General', 'Easy', 0, 3),
(75, 'The {children} are at school.', 'الأطفال في المدرسة.', 'children', 'Education', 'Easy', 0, 4),
(75, 'He is an only {child}.', 'إنه طفل وحيد (ليس له إخوة).', 'child', 'Family', 'Easy', 0, 5),
(75, 'When I was a {child}, I lived here.', 'عندما كنت طفلاً، كنت أعيش هنا.', 'child', 'Past Events', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(75, 'translation_match', 'easy', 'child', 'en', 'طفل', 'singular', NULL, NULL, NULL, '"child" refers to a young human.'),
(75, 'reverse_translation', 'easy', 'طفل', 'ar', 'child', 'singular', NULL, NULL, NULL, 'The Arabic "طفل" translates to "child" in English.'),
(75, 'sentence_completion', 'easy', 'The ___ is sleeping.', 'en', 'child', 'singular', 'The ___ is sleeping.', 'The child is sleeping.', 1, 'Use "child" for a single young human.'),
(75, 'sentence_completion', 'easy', 'How many ___ do you have?', 'en', 'children', 'plural', 'How many ___ do you have?', 'How many children do you have?', 2, 'Use "children" as the irregular plural of "child".'),
(75, 'sentence_completion', 'easy', 'She is a very happy ___ .', 'en', 'child', 'singular', 'She is a very happy ___ .', 'She is a very happy child.', 5, 'Use "child" to describe a single individual.'),
(75, 'sentence_completion', 'easy', 'The ___ are playing in the park.', 'en', 'children', 'plural', 'The ___ are playing in the park.', 'The children are playing in the park.', 1, 'Use "children" for a group of young humans.'),
(75, 'sentence_completion', 'easy', 'I have no ___ .', 'en', 'children', 'plural', 'I have no ___ .', 'I have no children.', 3, 'Use "children" to refer to offspring in general.'),
(75, 'sentence_completion', 'easy', 'A ___ needs a good education.', 'en', 'child', 'singular', 'A ___ needs a good education.', 'A child needs a good education.', 1, 'Use "child" to refer to a single young person.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(593, 'رجل'), (593, 'امرأة'), (593, 'بالغ'), (593, 'والد'), (593, 'معلم'), (593, 'حيوان'), (593, 'شيء'), (593, 'مكان'), (593, 'وقت'), (593, 'يوم'),
(594, 'man'), (594, 'woman'), (594, 'adult'), (594, 'parent'), (594, 'teacher'), (594, 'animal'), (594, 'thing'), (594, 'place'), (594, 'time'), (594, 'day'),
(595, 'man'), (595, 'woman'), (595, 'adult'), (595, 'parent'), (595, 'teacher'), (595, 'animal'), (595, 'thing'), (595, 'place'), (595, 'time'), (595, 'day'),
(596, 'child'), (596, 'man'), (596, 'men'), (596, 'woman'), (596, 'women'), (596, 'adult'), (596, 'adults'), (596, 'parent'), (596, 'parents'), (596, 'teacher'),
(597, 'man'), (597, 'woman'), (597, 'adult'), (597, 'parent'), (597, 'teacher'), (597, 'animal'), (597, 'thing'), (597, 'place'), (597, 'time'), (597, 'day'),
(598, 'child'), (598, 'man'), (598, 'men'), (598, 'woman'), (598, 'women'), (598, 'adult'), (598, 'adults'), (598, 'parent'), (598, 'parents'), (598, 'teacher'),
(599, 'child'), (599, 'man'), (599, 'men'), (599, 'woman'), (599, 'women'), (599, 'adult'), (599, 'adults'), (599, 'parent'), (599, 'parents'), (599, 'teacher'),
(600, 'children'), (600, 'man'), (600, 'woman'), (600, 'adult'), (600, 'parent'), (600, 'teacher'), (600, 'animal'), (600, 'thing'), (600, 'place'), (600, 'time');

-- =============================================================================
-- WORD 76: oh (ID: 76, POS: exclam.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (76, 'oh', 'أوه', 'exclam.', 'Used to express surprise, pain, or to get someone''s attention.', 'تستخدم للتعبير عن المفاجأة أو الألم أو لجذب انتباه شخص ما.', 'أوه', '["يا", "آه"]', '{"base": "oh"}', '/oʊ/', 'oh.mp3', '{"synonyms": ["ah", "wow"], "antonyms": [], "word_family": []}', 'Very common in spoken English to show emotion or realization.', 'Beginner', 141);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(76, '{Oh}, I didn''t see you there!', 'أوه، لم أرك هناك!', 'oh', 'Surprise', 'Easy', 1, 1),
(76, '{Oh} no, I forgot my keys.', 'أوه لا، لقد نسيت مفاتيحي.', 'oh', 'Realization', 'Easy', 0, 2),
(76, '{Oh}, really? That is interesting.', 'أوه، حقاً؟ هذا مثير للاهتمام.', 'oh', 'Conversation', 'Easy', 0, 3),
(76, '{Oh}, I see what you mean.', 'أوه، فهمت ما تقصده.', 'oh', 'Understanding', 'Easy', 0, 4),
(76, '{Oh}, hello! How are you?', 'أوه، مرحباً! كيف حالك؟', 'oh', 'Greeting', 'Easy', 0, 5),
(76, '{Oh}, that hurts!', 'آه، هذا مؤلم!', 'oh', 'Pain', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(76, 'translation_match', 'easy', 'oh', 'en', 'أوه', 'base', NULL, NULL, NULL, '"oh" is an exclamation used to express various emotions.'),
(76, 'reverse_translation', 'easy', 'أوه', 'ar', 'oh', 'base', NULL, NULL, NULL, 'The Arabic exclamation "أوه" translates to "oh" in English.'),
(76, 'sentence_completion', 'easy', '___ no! I lost my phone.', 'en', 'Oh', 'base', '___ no! I lost my phone.', 'Oh no! I lost my phone.', 0, 'Use "Oh" with "no" to express distress.'),
(76, 'sentence_completion', 'easy', '___, I forgot to tell you.', 'en', 'Oh', 'base', '___, I forgot to tell you.', 'Oh, I forgot to tell you.', 0, 'Use "Oh" to indicate a sudden realization.'),
(76, 'sentence_completion', 'easy', '___ really? I didn''t know that.', 'en', 'Oh', 'base', '___ really? I didn''t know that.', 'Oh really? I didn''t know that.', 0, 'Use "Oh" to express surprise or inquiry.'),
(76, 'sentence_completion', 'easy', '___, thank you so much.', 'en', 'Oh', 'base', '___, thank you so much.', 'Oh, thank you so much.', 0, 'Use "Oh" to add emphasis to a thank you.'),
(76, 'sentence_completion', 'easy', '___, I see.', 'en', 'Oh', 'base', '___, I see.', 'Oh, I see.', 0, 'Use "Oh" to show you have understood something.'),
(76, 'sentence_completion', 'easy', '___, hello Sarah!', 'en', 'Oh', 'base', '___, hello Sarah!', 'Oh, hello Sarah!', 0, 'Use "Oh" to show surprise when greeting someone.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(601, 'نعم'), (601, 'لا'), (601, 'شكراً'), (601, 'من'), (601, 'إلى'), (601, 'في'), (601, 'على'), (601, 'مع'), (601, 'عن'), (601, 'بـ'),
(602, 'yes'), (602, 'no'), (602, 'thanks'), (602, 'from'), (602, 'to'), (602, 'in'), (602, 'on'), (602, 'with'), (602, 'about'), (602, 'by'),
(603, 'Yes'), (603, 'No'), (603, 'So'), (603, 'But'), (603, 'And'), (603, 'If'), (603, 'Or'), (603, 'The'), (603, 'A'), (603, 'An'),
(604, 'Yes'), (604, 'No'), (604, 'So'), (604, 'But'), (604, 'And'), (604, 'If'), (604, 'Or'), (604, 'The'), (604, 'A'), (604, 'An'),
(605, 'Yes'), (605, 'No'), (605, 'So'), (605, 'But'), (605, 'And'), (605, 'If'), (605, 'Or'), (605, 'The'), (605, 'A'), (605, 'An'),
(606, 'Yes'), (606, 'No'), (606, 'So'), (606, 'But'), (606, 'And'), (606, 'If'), (606, 'Or'), (606, 'The'), (606, 'A'), (606, 'An'),
(607, 'Yes'), (607, 'No'), (607, 'So'), (607, 'But'), (607, 'And'), (607, 'If'), (607, 'Or'), (607, 'The'), (607, 'A'), (607, 'An'),
(608, 'Yes'), (608, 'No'), (608, 'So'), (608, 'But'), (608, 'And'), (608, 'If'), (608, 'Or'), (608, 'The'), (608, 'A'), (608, 'An');

-- =============================================================================
-- WORD 77: ask (ID: 77, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (77, 'ask', 'يسأل', 'v.', 'To say something in order to obtain information or a request.', 'قول شيء من أجل الحصول على معلومات أو تقديم طلب.', 'يسأل', '["يطلب"]', '{"base": "ask", "thirdPerson": "asks", "past": "asked", "participle": "asked", "gerund": "asking"}', '/æsk/', 'ask.mp3', '{"synonyms": ["question", "request", "inquire"], "antonyms": ["answer", "reply"], "word_family": []}', 'Commonly used with "for" when requesting an object.', 'Beginner', 143);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(77, 'Can I {ask} a question?', 'هل يمكنني طرح سؤال؟', 'ask', 'Inquiry', 'Easy', 1, 1),
(77, 'He {asks} a lot of questions.', 'هو يطرح الكثير من الأسئلة.', 'asks', 'General', 'Easy', 0, 2),
(77, 'I {asked} him for help.', 'طلبت منه المساعدة.', 'asked', 'Requests', 'Easy', 0, 3),
(77, 'She is {asking} about the price.', 'هي تسأل عن السعر.', 'asking', 'Shopping', 'Easy', 0, 4),
(77, 'Don''t be afraid to {ask}.', 'لا تخف من السؤال.', 'ask', 'Advice', 'Easy', 0, 5),
(77, 'They {asked} us to wait.', 'طلبوا منا الانتظار.', 'asked', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(77, 'translation_match', 'easy', 'ask', 'en', 'يسأل', 'base', NULL, NULL, NULL, '"ask" is the base verb for inquiring or requesting.'),
(77, 'reverse_translation', 'easy', 'يسأل', 'ar', 'ask', 'base', NULL, NULL, NULL, 'The Arabic verb "يسأل" translates to "ask".'),
(77, 'sentence_completion', 'easy', 'I want to ___ you something.', 'en', 'ask', 'base', 'I want to ___ you something.', 'I want to ask you something.', 3, 'Use the base form "ask" after "want to".'),
(77, 'sentence_completion', 'easy', 'She ___ me for my phone number.', 'en', 'asked', 'past', 'She ___ me for my phone number.', 'She asked me for my phone number.', 1, 'Use "asked" for the past tense of "ask".'),
(77, 'sentence_completion', 'easy', 'He always ___ for more time.', 'en', 'asks', 'thirdPerson', 'He always ___ for more time.', 'He always asks for more time.', 2, 'Use "asks" for third-person singular present.'),
(77, 'sentence_completion', 'easy', 'Stop ___ so many questions.', 'en', 'asking', 'gerund', 'Stop ___ so many questions.', 'Stop asking so many questions.', 1, 'Use "asking" as the gerund after "stop".'),
(77, 'sentence_completion', 'easy', 'I have ___ everyone, but no one knows.', 'en', 'asked', 'participle', 'I have ___ everyone, but no one knows.', 'I have asked everyone, but no one knows.', 2, 'Use "asked" as the past participle after "have".'),
(77, 'sentence_completion', 'easy', '___ him if he is coming.', 'en', 'Ask', 'base', '___ him if he is coming.', 'Ask him if he is coming.', 0, 'Use the base form "Ask" for an imperative.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(609, 'يجيب'), (609, 'يقول'), (609, 'يخبر'), (609, 'يسمع'), (609, 'يرى'), (609, 'يفعل'), (609, 'يذهب'), (609, 'يأتي'), (609, 'يأخذ'), (609, 'يعطي'),
(610, 'answer'), (610, 'reply'), (610, 'say'), (610, 'tell'), (610, 'hear'), (610, 'see'), (610, 'do'), (610, 'go'), (610, 'come'), (610, 'take'),
(611, 'asks'), (611, 'asked'), (611, 'asking'), (611, 'answers'), (611, 'answered'), (611, 'says'), (611, 'said'), (611, 'tells'), (611, 'told'), (611, 'hearing'),
(612, 'ask'), (612, 'asks'), (612, 'asking'), (612, 'answer'), (612, 'answers'), (612, 'answered'), (612, 'say'), (612, 'says'), (612, 'said'), (612, 'tell'),
(613, 'ask'), (613, 'asked'), (613, 'asking'), (613, 'answer'), (613, 'answers'), (613, 'answered'), (613, 'say'), (613, 'says'), (613, 'said'), (613, 'tell'),
(614, 'ask'), (614, 'asks'), (614, 'asked'), (614, 'answer'), (614, 'answering'), (614, 'answered'), (614, 'say'), (614, 'saying'), (614, 'said'), (614, 'tell'),
(615, 'ask'), (615, 'asks'), (615, 'asking'), (615, 'answer'), (615, 'answers'), (615, 'answered'), (615, 'say'), (615, 'says'), (615, 'said'), (615, 'tell'),
(616, 'Asks'), (616, 'Asked'), (616, 'Asking'), (616, 'Answer'), (616, 'Answers'), (616, 'Answered'), (616, 'Say'), (616, 'Says'), (616, 'Said'), (616, 'Tell');

-- =============================================================================
-- WORD 78: when (ID: 78, POS: adv., pron., conj.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (78, 'when', 'متى', 'adv., pron., conj.', 'At what time; or at the time that.', 'في أي وقت؛ أو في الوقت الذي.', 'متى', '["عندما"]', '{"base": "when"}', '/wen/', 'when.mp3', '{"synonyms": ["at what time"], "antonyms": [], "word_family": ["whenever"]}', 'Used to ask about time or to link events in time.', 'Beginner', 144);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(78, '{When} is your birthday?', 'متى عيد ميلادك؟', 'when', 'Time', 'Easy', 1, 1),
(78, 'Call me {when} you arrive.', 'اتصل بي عندما تصل.', 'when', 'Communication', 'Easy', 0, 2),
(78, '{When} do you sleep?', 'متى تنام؟', 'when', 'Routine', 'Easy', 0, 3),
(78, 'I was happy {when} I saw you.', 'كنت سعيداً عندما رأيتك.', 'when', 'Emotion', 'Easy', 0, 4),
(78, '{When} does the movie start?', 'متى يبدأ الفيلم؟', 'when', 'Entertainment', 'Easy', 0, 5),
(78, 'Tell me {when} to go.', 'أخبرني متى أذهب.', 'when', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(78, 'translation_match', 'easy', 'when', 'en', 'متى', 'base', NULL, NULL, NULL, '"when" is used to ask about time.'),
(78, 'reverse_translation', 'easy', 'متى', 'ar', 'when', 'base', NULL, NULL, NULL, 'The Arabic "متى" translates to "when" in English.'),
(78, 'sentence_completion', 'easy', '___ is the party?', 'en', 'When', 'base', '___ is the party?', 'When is the party?', 0, 'Use "When" to ask about the time of an event.'),
(78, 'sentence_completion', 'easy', 'I will eat ___ I am hungry.', 'en', 'when', 'base', 'I will eat ___ I am hungry.', 'I will eat when I am hungry.', 3, 'Use "when" as a conjunction to indicate time.'),
(78, 'sentence_completion', 'easy', '___ do you wake up?', 'en', 'When', 'base', '___ do you wake up?', 'When do you wake up?', 0, 'Use "When" to ask about a daily routine time.'),
(78, 'sentence_completion', 'easy', 'He was sleeping ___ I called.', 'en', 'when', 'base', 'He was sleeping ___ I called.', 'He was sleeping when I called.', 3, 'Use "when" to link two past actions in time.'),
(78, 'sentence_completion', 'easy', '___ does the train leave?', 'en', 'When', 'base', '___ does the train leave?', 'When does the train leave?', 0, 'Use "When" to ask about a schedule.'),
(78, 'sentence_completion', 'easy', 'I don''t know ___ he will come.', 'en', 'when', 'base', 'I don''t know ___ he will come.', 'I don''t know when he will come.', 3, 'Use "when" to refer to an unknown time.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(617, 'أين'), (617, 'لماذا'), (617, 'كيف'), (617, 'من'), (617, 'ماذا'), (617, 'أي'), (617, 'كم'), (617, 'هل'), (617, 'أينما'), (617, 'كيفما'),
(618, 'where'), (618, 'why'), (618, 'how'), (618, 'who'), (618, 'what'), (618, 'which'), (618, 'how many'), (618, 'whose'), (618, 'whether'), (618, 'if'),
(619, 'Where'), (619, 'Why'), (619, 'How'), (619, 'Who'), (619, 'What'), (619, 'Which'), (619, 'That'), (619, 'This'), (619, 'It'), (619, 'Whose'),
(620, 'where'), (620, 'why'), (620, 'how'), (620, 'who'), (620, 'what'), (620, 'which'), (620, 'that'), (620, 'this'), (620, 'it'), (620, 'whose'),
(621, 'Where'), (621, 'Why'), (621, 'How'), (621, 'Who'), (621, 'What'), (621, 'Which'), (621, 'That'), (621, 'This'), (621, 'It'), (621, 'Whose'),
(622, 'where'), (622, 'why'), (622, 'how'), (622, 'who'), (622, 'what'), (622, 'which'), (622, 'that'), (622, 'this'), (622, 'it'), (622, 'whose'),
(623, 'Where'), (623, 'Why'), (623, 'How'), (623, 'Who'), (623, 'What'), (623, 'Which'), (623, 'That'), (623, 'This'), (623, 'It'), (623, 'Whose'),
(624, 'where'), (624, 'why'), (624, 'how'), (624, 'who'), (624, 'what'), (624, 'which'), (624, 'that'), (624, 'this'), (624, 'it'), (624, 'whose');

-- =============================================================================
-- WORD 79: as (ID: 79, POS: prep.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (79, 'as', 'كـ / كما', 'prep.', 'Used to refer to the function or character that someone or something has.', 'يستخدم للإشارة إلى الوظيفة أو الشخصية التي يتمتع بها شخص ما أو شيء ما.', 'كـ / كما', '["مثل", "بما أن"]', '{"base": "as"}', '/æz/', 'as.mp3', '{"synonyms": ["like", "while"], "antonyms": [], "word_family": []}', 'Can be used for comparison, time, or role.', 'Beginner', 145);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(79, 'He works {as} a teacher.', 'هو يعمل كمعلم.', 'as', 'Jobs', 'Easy', 1, 1),
(79, 'She is {as} tall {as} her mother.', 'هي طويلة مثل والدتها.', 'as', 'Comparison', 'Easy', 0, 2),
(79, 'Do {as} I say.', 'افعل كما أقول.', 'as', 'Instruction', 'Easy', 0, 3),
(79, '{As} it was raining, we stayed home.', 'بما أنها كانت تمطر، بقينا في المنزل.', 'as', 'Reason', 'Easy', 0, 4),
(79, 'I saw him {as} I was leaving.', 'رأيته بينما كنت أغادر.', 'as', 'Time', 'Easy', 0, 5),
(79, 'It is not {as} easy {as} it looks.', 'الأمر ليس سهلاً كما يبدو.', 'as', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(79, 'translation_match', 'easy', 'as', 'en', 'كـ / كما', 'base', NULL, NULL, NULL, '"as" is used to describe roles or comparisons.'),
(79, 'reverse_translation', 'easy', 'كـ / كما', 'ar', 'as', 'base', NULL, NULL, NULL, 'The Arabic "كـ" or "كما" often translates to "as".'),
(79, 'sentence_completion', 'easy', 'She works ___ a nurse.', 'en', 'as', 'base', 'She works ___ a nurse.', 'She works as a nurse.', 2, 'Use "as" to indicate a job or role.'),
(79, 'sentence_completion', 'easy', 'He is as strong ___ an ox.', 'en', 'as', 'base', 'He is as strong ___ an ox.', 'He is as strong as an ox.', 4, 'Use "as...as" for comparisons.'),
(79, 'sentence_completion', 'easy', '___ I mentioned before, it is free.', 'en', 'As', 'base', '___ I mentioned before, it is free.', 'As I mentioned before, it is free.', 0, 'Use "As" to refer back to a previous statement.'),
(79, 'sentence_completion', 'easy', 'I arrived just ___ he left.', 'en', 'as', 'base', 'I arrived just ___ he left.', 'I arrived just as he left.', 3, 'Use "as" to indicate simultaneous actions.'),
(79, 'sentence_completion', 'easy', '___ you know, today is a holiday.', 'en', 'As', 'base', '___ you know, today is a holiday.', 'As you know, today is a holiday.', 0, 'Use "As" to introduce a known fact.'),
(79, 'sentence_completion', 'easy', 'It is not so big ___ that one.', 'en', 'as', 'base', 'It is not so big ___ that one.', 'It is not so big as that one.', 4, 'Use "as" in negative comparisons.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(625, 'من'), (625, 'إلى'), (625, 'في'), (625, 'على'), (625, 'مع'), (625, 'عن'), (625, 'بـ'), (625, 'و'), (625, 'أو'), (625, 'لكن'),
(626, 'than'), (626, 'like'), (626, 'so'), (626, 'but'), (626, 'for'), (626, 'from'), (626, 'with'), (626, 'at'), (626, 'by'), (626, 'of'),
(627, 'like'), (627, 'than'), (627, 'so'), (627, 'but'), (627, 'for'), (627, 'from'), (627, 'with'), (627, 'at'), (627, 'by'), (627, 'of'),
(628, 'than'), (628, 'like'), (628, 'so'), (628, 'but'), (628, 'for'), (628, 'from'), (628, 'with'), (628, 'at'), (628, 'by'), (628, 'of'),
(629, 'Than'), (629, 'Like'), (629, 'So'), (629, 'But'), (629, 'For'), (629, 'From'), (629, 'With'), (629, 'At'), (629, 'By'), (629, 'Of'),
(630, 'than'), (630, 'like'), (630, 'so'), (630, 'but'), (630, 'for'), (630, 'from'), (630, 'with'), (630, 'at'), (630, 'by'), (630, 'of'),
(631, 'Than'), (631, 'Like'), (631, 'So'), (631, 'But'), (631, 'For'), (631, 'From'), (631, 'With'), (631, 'At'), (631, 'By'), (631, 'Of'),
(632, 'than'), (632, 'like'), (632, 'so'), (632, 'but'), (632, 'for'), (632, 'from'), (632, 'with'), (632, 'at'), (632, 'by'), (632, 'of');

-- =============================================================================
-- WORD 80: school (ID: 80, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (80, 'school', 'مدرسة', 'n.', 'An institution for educating children.', 'مؤسسة لتعليم الأطفال.', 'مدرسة', '["تعليم"]', '{"singular": "school", "plural": "schools"}', '/skuːl/', 'school.mp3', '{"synonyms": ["academy", "college"], "antonyms": [], "word_family": ["schooling", "scholar"]}', 'Used to refer to the building or the educational process.', 'Beginner', 146);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(80, 'I go to {school} every day.', 'أذهب إلى المدرسة كل يوم.', 'school', 'Routine', 'Easy', 1, 1),
(80, 'The {school} is near my house.', 'المدرسة قريبة من منزلي.', 'school', 'Location', 'Easy', 0, 2),
(80, 'There are many {schools} in this city.', 'هناك العديد من المدارس في هذه المدينة.', 'schools', 'General', 'Easy', 0, 3),
(80, 'He is at {school} right now.', 'هو في المدرسة الآن.', 'school', 'Location', 'Easy', 0, 4),
(80, 'I like my {school} friends.', 'أحب أصدقائي في المدرسة.', 'school', 'Social', 'Easy', 0, 5),
(80, 'She finished {school} last year.', 'أنهت دراستها العام الماضي.', 'school', 'Time', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(80, 'translation_match', 'easy', 'school', 'en', 'مدرسة', 'singular', NULL, NULL, NULL, '"school" is the place where students learn.'),
(80, 'reverse_translation', 'easy', 'مدرسة', 'ar', 'school', 'singular', NULL, NULL, NULL, 'The Arabic "مدرسة" translates to "school" in English.'),
(80, 'sentence_completion', 'easy', 'Children go to ___ to learn.', 'en', 'school', 'singular', 'Children go to ___ to learn.', 'Children go to school to learn.', 3, 'Use "school" to refer to the institution of learning.'),
(80, 'sentence_completion', 'easy', 'The ___ starts at 8 AM.', 'en', 'school', 'singular', 'The ___ starts at 8 AM.', 'The school starts at 8 AM.', 1, 'Use "school" to refer to the daily educational session.'),
(80, 'sentence_completion', 'easy', 'There are two ___ in our village.', 'en', 'schools', 'plural', 'There are two ___ in our village.', 'There are two schools in our village.', 3, 'Use "schools" for more than one educational building.'),
(80, 'sentence_completion', 'easy', 'He is a ___ teacher.', 'en', 'school', 'singular', 'He is a ___ teacher.', 'He is a school teacher.', 3, 'Use "school" as a modifier for "teacher".'),
(80, 'sentence_completion', 'easy', 'I walk to ___ with my brother.', 'en', 'school', 'singular', 'I walk to ___ with my brother.', 'I walk to school with my brother.', 3, 'Use "school" to indicate the destination of the walk.'),
(80, 'sentence_completion', 'easy', 'My ___ is very big.', 'en', 'school', 'singular', 'My ___ is very big.', 'My school is very big.', 1, 'Use "school" to refer to the specific building.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(633, 'بيت'), (633, 'عمل'), (633, 'مستشفى'), (633, 'حديقة'), (633, 'سوق'), (633, 'مكتب'), (633, 'شارع'), (633, 'مدينة'), (633, 'وقت'), (633, 'يوم'),
(634, 'house'), (634, 'work'), (634, 'hospital'), (634, 'park'), (634, 'market'), (634, 'office'), (634, 'street'), (634, 'city'), (634, 'time'), (634, 'day'),
(635, 'house'), (635, 'work'), (635, 'hospital'), (635, 'park'), (635, 'market'), (635, 'office'), (635, 'street'), (635, 'city'), (635, 'time'), (635, 'day'),
(636, 'house'), (636, 'work'), (636, 'hospital'), (636, 'park'), (636, 'market'), (636, 'office'), (636, 'street'), (636, 'city'), (636, 'time'), (636, 'day'),
(637, 'schools'), (637, 'houses'), (637, 'works'), (637, 'hospitals'), (637, 'parks'), (637, 'markets'), (637, 'offices'), (637, 'streets'), (637, 'cities'), (637, 'days'),
(638, 'house'), (638, 'work'), (638, 'hospital'), (638, 'park'), (638, 'market'), (638, 'office'), (638, 'street'), (638, 'city'), (638, 'time'), (638, 'day'),
(639, 'house'), (639, 'work'), (639, 'hospital'), (639, 'park'), (639, 'market'), (639, 'office'), (639, 'street'), (639, 'city'), (639, 'time'), (639, 'day'),
(640, 'house'), (640, 'work'), (640, 'hospital'), (640, 'park'), (640, 'market'), (640, 'office'), (640, 'street'), (640, 'city'), (640, 'time'), (640, 'day');

-- =============================================================================
-- WORD 81: out (ID: 81, POS: adv./prep.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (81, 'out', 'خارج', 'adv./prep.', 'Moving away from a particular place or being outside.', 'التحرك بعيداً عن مكان معين أو التواجد في الخارج.', 'خارج', '["في الخارج", "انتهى"]', '{"base": "out"}', '/aʊt/', 'out.mp3', '{"synonyms": ["outside", "away"], "antonyms": ["in", "inside"], "word_family": ["outer", "outward"]}', 'Often used in phrasal verbs like "go out" or "get out".', 'Beginner', 150);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(81, 'Please go {out} of the room.', 'من فضلك اخرج من الغرفة.', 'out', 'Instruction', 'Easy', 1, 1),
(81, 'The cat is {out} in the garden.', 'القطة في الخارج في الحديقة.', 'out', 'Location', 'Easy', 0, 2),
(81, 'We are going {out} tonight.', 'نحن خارجون الليلة.', 'out', 'Social', 'Easy', 0, 3),
(81, 'Look {out} the window.', 'انظر من النافذة.', 'out', 'Direction', 'Easy', 0, 4),
(81, 'The fire went {out}.', 'انطفأت النار.', 'out', 'General', 'Easy', 0, 5),
(81, 'Take the trash {out}.', 'أخرج القمامة.', 'out', 'Home', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(81, 'translation_match', 'easy', 'out', 'en', 'خارج', 'base', NULL, NULL, NULL, '"out" indicates movement to the exterior or being outside.'),
(81, 'reverse_translation', 'easy', 'خارج', 'ar', 'out', 'base', NULL, NULL, NULL, 'The Arabic "خارج" translates to "out" in English.'),
(81, 'sentence_completion', 'easy', 'Get ___ of here!', 'en', 'out', 'base', 'Get ___ of here!', 'Get out of here!', 1, 'Use "out" to indicate leaving a place.'),
(81, 'sentence_completion', 'easy', 'He is ___ of the office.', 'en', 'out', 'base', 'He is ___ of the office.', 'He is out of the office.', 2, 'Use "out" to mean not present in a location.'),
(81, 'sentence_completion', 'easy', 'The stars are ___ tonight.', 'en', 'out', 'base', 'The stars are ___ tonight.', 'The stars are out tonight.', 3, 'Use "out" to mean visible in the sky.'),
(81, 'sentence_completion', 'easy', 'Watch ___ for the car!', 'en', 'out', 'base', 'Watch ___ for the car!', 'Watch out for the car!', 1, '"Watch out" is a common phrasal verb for being careful.'),
(81, 'sentence_completion', 'easy', 'I am ___ of money.', 'en', 'out', 'base', 'I am ___ of money.', 'I am out of money.', 2, 'Use "out of" to mean having no more of something.'),
(81, 'sentence_completion', 'easy', 'Let the dog ___ .', 'en', 'out', 'base', 'Let the dog ___ .', 'Let the dog out.', 3, 'Use "out" to indicate allowing something to leave.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(641, 'في'), (641, 'على'), (641, 'تحت'), (641, 'بجانب'), (641, 'خلف'), (641, 'أمام'), (641, 'مع'), (641, 'من'), (641, 'إلى'), (641, 'عن'),
(642, 'in'), (642, 'on'), (642, 'at'), (642, 'by'), (642, 'with'), (642, 'for'), (642, 'from'), (642, 'to'), (642, 'up'), (642, 'down'),
(643, 'in'), (643, 'on'), (643, 'at'), (643, 'by'), (643, 'with'), (643, 'for'), (643, 'from'), (643, 'to'), (643, 'up'), (643, 'down'),
(644, 'in'), (644, 'on'), (644, 'at'), (644, 'by'), (644, 'with'), (644, 'for'), (644, 'from'), (644, 'to'), (644, 'up'), (644, 'down'),
(645, 'in'), (645, 'on'), (645, 'at'), (645, 'by'), (645, 'with'), (645, 'for'), (645, 'from'), (645, 'to'), (645, 'up'), (645, 'down'),
(646, 'in'), (646, 'on'), (646, 'at'), (646, 'by'), (646, 'with'), (646, 'for'), (646, 'from'), (646, 'to'), (646, 'up'), (646, 'down'),
(647, 'in'), (647, 'on'), (647, 'at'), (647, 'by'), (647, 'with'), (647, 'for'), (647, 'from'), (647, 'to'), (647, 'up'), (647, 'down'),
(648, 'in'), (648, 'on'), (648, 'at'), (648, 'by'), (648, 'with'), (648, 'for'), (648, 'from'), (648, 'to'), (648, 'up'), (648, 'down');

-- =============================================================================
-- WORD 82: keep (ID: 82, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (82, 'keep', 'يحفظ / يستمر', 'v.', 'To have or retain possession of; or to continue in a specified condition.', 'الامتلاك أو الاحتفاظ بـ؛ أو الاستمرار في حالة محددة.', 'يحفظ / يستمر', '["يحتفظ", "يظل"]', '{"base": "keep", "thirdPerson": "keeps", "past": "kept", "participle": "kept", "gerund": "keeping"}', '/kiːp/', 'keep.mp3', '{"synonyms": ["retain", "hold", "continue"], "antonyms": ["give", "lose", "stop"], "word_family": ["keeper", "keeping"]}', 'Often followed by a gerund (keep doing something).', 'Beginner', 151);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(82, 'Please {keep} the change.', 'من فضلك احتفظ بالباقي.', 'keep', 'Money', 'Easy', 1, 1),
(82, 'He {keeps} his room clean.', 'هو يحافظ على غرفته نظيفة.', 'keeps', 'Home', 'Easy', 0, 2),
(82, 'I {kept} my promise.', 'وفيت بوعدي (حافظت على وعدي).', 'kept', 'Social', 'Easy', 0, 3),
(82, '{Keep} going straight.', 'استمر في السير للأمام مباشرة.', 'keep', 'Direction', 'Easy', 0, 4),
(82, 'She is {keeping} a secret.', 'هي تحفظ سراً.', 'keeping', 'Communication', 'Easy', 0, 5),
(82, 'Can you {keep} an eye on my bag?', 'هل يمكنك مراقبة حقيبتي؟', 'keep', 'Requests', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(82, 'translation_match', 'easy', 'keep', 'en', 'يحفظ / يستمر', 'base', NULL, NULL, NULL, '"keep" is the base verb for retaining or continuing.'),
(82, 'reverse_translation', 'easy', 'يحفظ', 'ar', 'keep', 'base', NULL, NULL, NULL, 'The Arabic verb "يحفظ" translates to "keep".'),
(82, 'sentence_completion', 'easy', '___ the door closed.', 'en', 'Keep', 'base', '___ the door closed.', 'Keep the door closed.', 0, 'Use the base form "Keep" for an imperative command.'),
(82, 'sentence_completion', 'easy', 'She ___ her books in the desk.', 'en', 'keeps', 'thirdPerson', 'She ___ her books in the desk.', 'She keeps her books in the desk.', 1, 'Use "keeps" for third-person singular present.'),
(82, 'sentence_completion', 'easy', 'He ___ walking despite the rain.', 'en', 'kept', 'past', 'He ___ walking despite the rain.', 'He kept walking despite the rain.', 1, 'Use "kept" for the past tense of "keep".'),
(82, 'sentence_completion', 'easy', 'I am ___ this for you.', 'en', 'keeping', 'gerund', 'I am ___ this for you.', 'I am keeping this for you.', 2, 'Use "keeping" for the present continuous.'),
(82, 'sentence_completion', 'easy', 'You should ___ trying.', 'en', 'keep', 'base', 'You should ___ trying.', 'You should keep trying.', 2, 'Use the base form "keep" after the modal "should".'),
(82, 'sentence_completion', 'easy', 'Have you ___ the receipt?', 'en', 'kept', 'participle', 'Have you ___ the receipt?', 'Have you kept the receipt?', 2, 'Use "kept" as the past participle after "have".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(649, 'يعطي'), (649, 'يفقد'), (649, 'يأخذ'), (649, 'يضع'), (649, 'يذهب'), (649, 'يأكل'), (649, 'ينام'), (649, 'يرى'), (649, 'يقول'), (649, 'يصنع'),
(650, 'give'), (650, 'lose'), (650, 'take'), (650, 'put'), (650, 'go'), (650, 'eat'), (650, 'sleep'), (650, 'see'), (650, 'say'), (650, 'make'),
(651, 'Keeps'), (651, 'Kept'), (651, 'Keeping'), (651, 'Gives'), (651, 'Takes'), (651, 'Puts'), (651, 'Goes'), (651, 'Sees'), (651, 'Does'), (651, 'Says'),
(652, 'keep'), (652, 'kept'), (652, 'keeping'), (652, 'give'), (652, 'gives'), (652, 'take'), (652, 'takes'), (652, 'put'), (652, 'puts'), (652, 'see'),
(653, 'keep'), (653, 'keeps'), (653, 'keeping'), (653, 'give'), (653, 'gave'), (653, 'take'), (653, 'took'), (653, 'put'), (653, 'put'), (653, 'see'),
(654, 'keep'), (654, 'keeps'), (654, 'kept'), (654, 'give'), (654, 'giving'), (654, 'take'), (654, 'taking'), (654, 'put'), (654, 'putting'), (654, 'see'),
(655, 'keeps'), (655, 'kept'), (655, 'keeping'), (655, 'give'), (655, 'gives'), (655, 'take'), (655, 'takes'), (655, 'put'), (655, 'puts'), (655, 'see'),
(656, 'keep'), (656, 'keeps'), (656, 'keeping'), (656, 'give'), (656, 'given'), (656, 'take'), (656, 'taken'), (656, 'put'), (656, 'put'), (656, 'see');

-- =============================================================================
-- WORD 83: put (ID: 83, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (83, 'put', 'يضع', 'v.', 'To move something into a particular place or position.', 'نقل شيء ما إلى مكان أو وضع معين.', 'يضع', '["يرتدي", "يدون"]', '{"base": "put", "thirdPerson": "puts", "past": "put", "participle": "put", "gerund": "putting"}', '/pʊt/', 'put.mp3', '{"synonyms": ["place", "set", "lay"], "antonyms": ["remove", "take"], "word_family": []}', 'The past and participle forms are identical to the base form.', 'Beginner', 153);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(83, '{Put} the book on the table.', 'ضع الكتاب على الطاولة.', 'put', 'Instruction', 'Easy', 1, 1),
(83, 'She {puts} sugar in her tea.', 'هي تضع السكر في شايها.', 'puts', 'Food', 'Easy', 0, 2),
(83, 'I {put} my keys in my pocket yesterday.', 'وضعت مفاتيحي في جيبي أمس.', 'put', 'Past Events', 'Easy', 0, 3),
(83, 'He is {putting} on his coat.', 'هو يرتدي معطفه.', 'putting', 'Clothing', 'Easy', 0, 4),
(83, 'Where did you {put} it?', 'أين وضعته؟', 'put', 'Inquiry', 'Easy', 0, 5),
(83, 'Please {put} away your toys.', 'من فضلك رتب ألعابك (ضعها جانباً).', 'put', 'Home', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(83, 'translation_match', 'easy', 'put', 'en', 'يضع', 'base', NULL, NULL, NULL, '"put" is the base verb for placing something.'),
(83, 'reverse_translation', 'easy', 'يضع', 'ar', 'put', 'base', NULL, NULL, NULL, 'The Arabic verb "يضع" translates to "put".'),
(83, 'sentence_completion', 'easy', '___ your bag here.', 'en', 'Put', 'base', '___ your bag here.', 'Put your bag here.', 0, 'Use the base form "Put" for an imperative.'),
(83, 'sentence_completion', 'easy', 'He ___ a lot of effort into his work.', 'en', 'puts', 'thirdPerson', 'He ___ a lot of effort into his work.', 'He puts a lot of effort into his work.', 1, 'Use "puts" for third-person singular present.'),
(83, 'sentence_completion', 'easy', 'I ___ it there this morning.', 'en', 'put', 'past', 'I ___ it there this morning.', 'I put it there this morning.', 1, 'The past tense of "put" is also "put".'),
(83, 'sentence_completion', 'easy', 'Stop ___ your feet on the sofa.', 'en', 'putting', 'gerund', 'Stop ___ your feet on the sofa.', 'Stop putting your feet on the sofa.', 1, 'Use "putting" as the gerund after "stop".'),
(83, 'sentence_completion', 'easy', 'She has ___ the baby to bed.', 'en', 'put', 'participle', 'She has ___ the baby to bed.', 'She has put the baby to bed.', 2, 'The past participle of "put" is also "put".'),
(83, 'sentence_completion', 'easy', '___ on your shoes.', 'en', 'Put', 'base', '___ on your shoes.', 'Put on your shoes.', 0, 'Use "Put on" to mean wear or dress.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(657, 'يأخذ'), (657, 'يعطي'), (657, 'يذهب'), (657, 'يأكل'), (657, 'ينام'), (657, 'يرى'), (657, 'يفعل'), (657, 'يقول'), (657, 'يأتي'), (657, 'يصنع'),
(658, 'take'), (658, 'give'), (658, 'go'), (658, 'eat'), (658, 'sleep'), (658, 'see'), (658, 'do'), (658, 'say'), (658, 'come'), (658, 'make'),
(659, 'Puts'), (659, 'Putting'), (659, 'Takes'), (659, 'Gives'), (659, 'Goes'), (659, 'Sees'), (659, 'Does'), (659, 'Says'), (659, 'Makes'), (659, 'Eats'),
(660, 'put'), (660, 'putting'), (660, 'take'), (660, 'takes'), (660, 'give'), (660, 'gives'), (660, 'go'), (660, 'goes'), (660, 'see'), (660, 'sees'),
(661, 'puts'), (661, 'putting'), (661, 'take'), (661, 'took'), (661, 'give'), (661, 'gave'), (661, 'go'), (661, 'went'), (661, 'see'), (661, 'saw'),
(662, 'put'), (662, 'puts'), (662, 'take'), (662, 'taking'), (662, 'give'), (662, 'giving'), (662, 'go'), (662, 'going'), (662, 'see'), (662, 'seeing'),
(663, 'puts'), (663, 'putting'), (663, 'take'), (663, 'taken'), (663, 'give'), (663, 'given'), (663, 'go'), (663, 'gone'), (663, 'see'), (663, 'seen'),
(664, 'Puts'), (664, 'Putting'), (664, 'Takes'), (664, 'Gives'), (664, 'Goes'), (664, 'Sees'), (664, 'Does'), (664, 'Says'), (664, 'Makes'), (664, 'Eats');

-- =============================================================================
-- WORD 84: big (ID: 84, POS: adj.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (84, 'big', 'كبير', 'adj.', 'Of considerable size, extent, or intensity.', 'ذو حجم أو مدى أو شدة كبيرة.', 'كبير', '["ضخم", "هام"]', '{"base": "big", "comparative": "bigger", "superlative": "biggest"}', '/bɪɡ/', 'big.mp3', '{"synonyms": ["large", "huge", "great"], "antonyms": ["small", "little"], "word_family": []}', 'Used to describe physical size or importance.', 'Beginner', 156);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(84, 'I live in a {big} house.', 'أنا أعيش في منزل كبير.', 'big', 'Home', 'Easy', 1, 1),
(84, 'Elephant is a {big} animal.', 'الفيل حيوان كبير.', 'big', 'Animals', 'Easy', 0, 2),
(84, 'This is a {bigger} problem than I thought.', 'هذه مشكلة أكبر مما ظننت.', 'bigger', 'Comparison', 'Easy', 0, 3),
(84, 'He is the {biggest} boy in class.', 'هو أكبر ولد في الفصل.', 'biggest', 'Comparison', 'Easy', 0, 4),
(84, 'I have a {big} family.', 'لي عائلة كبيرة.', 'big', 'Family', 'Easy', 0, 5),
(84, 'New York is a {big} city.', 'نيويورك مدينة كبيرة.', 'big', 'Location', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(84, 'translation_match', 'easy', 'big', 'en', 'كبير', 'base', NULL, NULL, NULL, '"big" is the basic adjective for large size.'),
(84, 'reverse_translation', 'easy', 'كبير', 'ar', 'big', 'base', NULL, NULL, NULL, 'The Arabic "كبير" translates to "big" in English.'),
(84, 'sentence_completion', 'easy', 'That is a very ___ dog.', 'en', 'big', 'base', 'That is a very ___ dog.', 'That is a very big dog.', 4, 'Use "big" to describe the size of an animal.'),
(84, 'sentence_completion', 'easy', 'My brother is ___ than me.', 'en', 'bigger', 'comparative', 'My brother is ___ than me.', 'My brother is bigger than me.', 3, 'Use "bigger" when comparing the size of two people.'),
(84, 'sentence_completion', 'easy', 'This is the ___ building in the city.', 'en', 'biggest', 'superlative', 'This is the ___ building in the city.', 'This is the biggest building in the city.', 3, 'Use "biggest" to indicate the largest among all.'),
(84, 'sentence_completion', 'easy', 'I made a ___ mistake.', 'en', 'big', 'base', 'I made a ___ mistake.', 'I made a big mistake.', 3, 'Use "big" to describe the intensity of an error.'),
(84, 'sentence_completion', 'easy', 'He has a ___ smile.', 'en', 'big', 'base', 'He has a ___ smile.', 'He has a big smile.', 3, 'Use "big" to describe a wide or prominent smile.'),
(84, 'sentence_completion', 'easy', 'Is the box ___ enough?', 'en', 'big', 'base', 'Is the box ___ enough?', 'Is the box big enough?', 3, 'Use "big" to ask about sufficient size.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(665, 'صغير'), (665, 'قليل'), (665, 'سيء'), (665, 'بارد'), (665, 'حزين'), (665, 'هنا'), (665, 'هناك'), (665, 'الآن'), (665, 'أبداً'), (665, 'دائماً'),
(666, 'small'), (666, 'little'), (666, 'bad'), (666, 'cold'), (666, 'sad'), (666, 'here'), (666, 'there'), (666, 'now'), (666, 'never'), (666, 'always'),
(667, 'small'), (667, 'little'), (667, 'bad'), (667, 'cold'), (667, 'sad'), (667, 'short'), (667, 'thin'), (667, 'poor'), (667, 'fast'), (667, 'slow'),
(668, 'big'), (668, 'biggest'), (668, 'small'), (668, 'smaller'), (668, 'smallest'), (668, 'bad'), (668, 'worse'), (668, 'worst'), (668, 'good'), (668, 'best'),
(669, 'big'), (669, 'bigger'), (669, 'small'), (669, 'smaller'), (669, 'smallest'), (669, 'bad'), (669, 'worse'), (669, 'worst'), (669, 'good'), (669, 'best'),
(670, 'small'), (670, 'little'), (670, 'bad'), (670, 'cold'), (670, 'sad'), (670, 'short'), (670, 'thin'), (670, 'poor'), (670, 'fast'), (670, 'slow'),
(671, 'small'), (671, 'little'), (671, 'bad'), (671, 'cold'), (671, 'sad'), (671, 'short'), (671, 'thin'), (671, 'poor'), (671, 'fast'), (671, 'slow'),
(672, 'small'), (672, 'little'), (672, 'bad'), (672, 'cold'), (672, 'sad'), (672, 'short'), (672, 'thin'), (672, 'poor'), (672, 'fast'), (672, 'slow');

-- =============================================================================
-- WORD 85: same (ID: 85, POS: adj., pron., adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (85, 'same', 'نفس', 'adj., pron., adv.', 'Identical; not different.', 'متطابق؛ ليس مختلفاً.', 'نفس', '["ذات", "متماثل"]', '{"base": "same"}', '/seɪm/', 'same.mp3', '{"synonyms": ["identical", "equal"], "antonyms": ["different", "other"], "word_family": []}', 'Usually used with the definite article "the".', 'Beginner', 158);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(85, 'We are the {same} age.', 'نحن في نفس العمر.', 'same', 'Age', 'Easy', 1, 1),
(85, 'I want the {same} thing.', 'أريد نفس الشيء.', 'same', 'Preferences', 'Easy', 0, 2),
(85, 'They live in the {same} street.', 'يعيشون في نفس الشارع.', 'same', 'Location', 'Easy', 0, 3),
(85, 'It is the {same} as before.', 'إنه نفس الشيء كما كان من قبل.', 'same', 'General', 'Easy', 0, 4),
(85, 'Happy New Year! - {Same} to you!', 'سنة جديدة سعيدة! - ولك بالمثل!', 'same', 'Social', 'Easy', 0, 5),
(85, 'We have the {same} ideas.', 'لدينا نفس الأفكار.', 'same', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(85, 'translation_match', 'easy', 'same', 'en', 'نفس', 'base', NULL, NULL, NULL, '"same" refers to things that are identical.'),
(85, 'reverse_translation', 'easy', 'نفس', 'ar', 'same', 'base', NULL, NULL, NULL, 'The Arabic "نفس" translates to "same" in English.'),
(85, 'sentence_completion', 'easy', 'We like the ___ music.', 'en', 'same', 'base', 'We like the ___ music.', 'We like the same music.', 3, 'Use "same" to show identical preferences.'),
(85, 'sentence_completion', 'easy', 'It is the ___ color as my car.', 'en', 'same', 'base', 'It is the ___ color as my car.', 'It is the same color as my car.', 3, 'Use "same" to compare identical colors.'),
(85, 'sentence_completion', 'easy', 'They arrived at the ___ time.', 'en', 'same', 'base', 'They arrived at the ___ time.', 'They arrived at the same time.', 4, 'Use "same" to show simultaneous events.'),
(85, 'sentence_completion', 'easy', 'I''ll have the ___ , please.', 'en', 'same', 'base', 'I''ll have the ___ , please.', 'I''ll have the same, please.', 3, 'Use "the same" as a pronoun to order the same item.'),
(85, 'sentence_completion', 'easy', 'You are always the ___ .', 'en', 'same', 'base', 'You are always the ___ .', 'You are always the same.', 4, 'Use "same" to describe unchanging character.'),
(85, 'sentence_completion', 'easy', 'Is this the ___ one?', 'en', 'same', 'base', 'Is this the ___ one?', 'Is this the same one?', 3, 'Use "same" to ask if an object is identical to one previously seen.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(673, 'مختلف'), (673, 'آخر'), (673, 'جديد'), (673, 'قديم'), (673, 'كبير'), (673, 'صغير'), (673, 'كل'), (673, 'بعض'), (673, 'هنا'), (673, 'هناك'),
(674, 'different'), (674, 'other'), (674, 'another'), (674, 'new'), (674, 'old'), (674, 'big'), (674, 'small'), (674, 'all'), (674, 'some'), (674, 'any'),
(675, 'different'), (675, 'other'), (675, 'another'), (675, 'new'), (675, 'old'), (675, 'big'), (675, 'small'), (675, 'all'), (675, 'some'), (675, 'any'),
(676, 'different'), (676, 'other'), (676, 'another'), (676, 'new'), (676, 'old'), (676, 'big'), (676, 'small'), (676, 'all'), (676, 'some'), (676, 'any'),
(677, 'different'), (677, 'other'), (677, 'another'), (677, 'new'), (677, 'old'), (677, 'big'), (677, 'small'), (677, 'all'), (677, 'some'), (677, 'any'),
(678, 'different'), (678, 'other'), (678, 'another'), (678, 'new'), (678, 'old'), (678, 'big'), (678, 'small'), (678, 'all'), (678, 'some'), (678, 'any'),
(679, 'different'), (679, 'other'), (679, 'another'), (679, 'new'), (679, 'old'), (679, 'big'), (679, 'small'), (679, 'all'), (679, 'some'), (679, 'any'),
(680, 'different'), (680, 'other'), (680, 'another'), (680, 'new'), (680, 'old'), (680, 'big'), (680, 'small'), (680, 'all'), (680, 'some'), (680, 'any');

-- =============================================================================
-- WORD 86: all (ID: 86, POS: det., pron.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (86, 'all', 'كل', 'det., pron.', 'The whole quantity or amount of something.', 'الكمية أو المقدار الكامل لشيء ما.', 'كل', '["جميع", "بأكمله"]', '{"base": "all"}', '/ɔːl/', 'all.mp3', '{"synonyms": ["every", "entire", "whole"], "antonyms": ["none", "some"], "word_family": []}', 'Can be used as a determiner, pronoun, or adverb.', 'Beginner', 159);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(86, '{All} the students are here.', 'كل الطلاب هنا.', 'all', 'Education', 'Easy', 1, 1),
(86, 'I ate {all} of the pizza.', 'أكلت البيتزا كلها.', 'all', 'Food', 'Easy', 0, 2),
(86, 'That is {all} for today.', 'هذا كل شيء لهذا اليوم.', 'all', 'Time', 'Easy', 0, 3),
(86, '{All} people need love.', 'كل الناس يحتاجون للحب.', 'all', 'Social', 'Easy', 0, 4),
(86, 'We {all} like music.', 'كلنا نحب الموسيقى.', 'all', 'Hobbies', 'Easy', 0, 5),
(86, 'Is that {all}?', 'هل هذا كل شيء؟', 'all', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(86, 'translation_match', 'easy', 'all', 'en', 'كل', 'base', NULL, NULL, NULL, '"all" refers to the entire group or amount.'),
(86, 'reverse_translation', 'easy', 'كل', 'ar', 'all', 'base', NULL, NULL, NULL, 'The Arabic "كل" translates to "all" in English.'),
(86, 'sentence_completion', 'easy', '___ my friends are kind.', 'en', 'All', 'base', '___ my friends are kind.', 'All my friends are kind.', 0, 'Use "All" to refer to the whole group of friends.'),
(86, 'sentence_completion', 'easy', 'I spent ___ my money.', 'en', 'all', 'base', 'I spent ___ my money.', 'I spent all my money.', 2, 'Use "all" to indicate the total amount of money.'),
(86, 'sentence_completion', 'easy', 'Is that ___ you have?', 'en', 'all', 'base', 'Is that ___ you have?', 'Is that all you have?', 2, 'Use "all" to mean "everything".'),
(86, 'sentence_completion', 'easy', 'We ___ want to go.', 'en', 'all', 'base', 'We ___ want to go.', 'We all want to go.', 1, 'Use "all" after a pronoun for emphasis.'),
(86, 'sentence_completion', 'easy', '___ day long.', 'en', 'All', 'base', '___ day long.', 'All day long.', 0, 'Common phrase meaning the entire day.'),
(86, 'sentence_completion', 'easy', '___ of a sudden.', 'en', 'All', 'base', '___ of a sudden.', 'All of a sudden.', 0, 'Idiomatic expression meaning "suddenly".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(681, 'بعض'), (681, 'لا شيء'), (681, 'واحد'), (681, 'قليل'), (681, 'كثير'), (681, 'نصف'), (681, 'أول'), (681, 'آخر'), (681, 'هنا'), (681, 'هناك'),
(682, 'some'), (682, 'none'), (682, 'one'), (682, 'few'), (682, 'many'), (682, 'half'), (682, 'first'), (682, 'last'), (682, 'only'), (682, 'any'),
(683, 'Some'), (683, 'None'), (683, 'One'), (683, 'Few'), (683, 'Many'), (683, 'Half'), (683, 'First'), (683, 'Last'), (683, 'Only'), (683, 'Any'),
(684, 'some'), (684, 'none'), (684, 'one'), (684, 'few'), (684, 'many'), (684, 'half'), (684, 'first'), (684, 'last'), (684, 'only'), (684, 'any'),
(685, 'some'), (685, 'none'), (685, 'one'), (685, 'few'), (685, 'many'), (685, 'half'), (685, 'first'), (685, 'last'), (685, 'only'), (685, 'any'),
(686, 'some'), (686, 'none'), (686, 'one'), (686, 'few'), (686, 'many'), (686, 'half'), (686, 'first'), (686, 'last'), (686, 'only'), (686, 'any'),
(687, 'Some'), (687, 'None'), (687, 'One'), (687, 'Few'), (687, 'Many'), (687, 'Half'), (687, 'First'), (687, 'Last'), (687, 'Only'), (687, 'Any'),
(688, 'Some'), (688, 'None'), (688, 'One'), (688, 'Few'), (688, 'Many'), (688, 'Half'), (688, 'First'), (688, 'Last'), (688, 'Only'), (688, 'Any');

-- =============================================================================
-- WORD 87: three (ID: 87, POS: number)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (87, 'three', 'ثلاثة', 'number', 'The number equivalent to the sum of one and two.', 'الرقم الذي يعادل مجموع واحد واثنين.', 'ثلاثة', '["رقم 3"]', '{"singular": "three"}', '/θriː/', 'three.mp3', '{"synonyms": [], "antonyms": [], "word_family": ["third", "thrice"]}', 'Used to count items or indicate quantity.', 'Beginner', 163);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(87, 'I have {three} cats.', 'لدي ثلاثة قطط.', 'three', 'Animals', 'Easy', 1, 1),
(87, '{Three} plus two is five.', 'ثلاثة زائد اثنان يساوي خمسة.', 'three', 'Math', 'Easy', 0, 2),
(87, 'It is {three} o''clock.', 'إنها الساعة الثالثة.', 'three', 'Time', 'Easy', 0, 3),
(87, 'I will stay for {three} days.', 'سأبقى لمدة ثلاثة أيام.', 'three', 'Time', 'Easy', 0, 4),
(87, 'There are {three} books on the desk.', 'هناك ثلاثة كتب على المكتب.', 'three', 'General', 'Easy', 0, 5),
(87, 'She has {three} brothers.', 'لها ثلاثة إخوة.', 'three', 'Family', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(87, 'translation_match', 'easy', 'three', 'en', 'ثلاثة', 'singular', NULL, NULL, NULL, '"three" is the number 3.'),
(87, 'reverse_translation', 'easy', 'ثلاثة', 'ar', 'three', 'singular', NULL, NULL, NULL, 'The Arabic "ثلاثة" translates to "three".'),
(87, 'sentence_completion', 'easy', 'One, two, ___ .', 'en', 'three', 'singular', 'One, two, ___ .', 'One, two, three.', 2, 'The number following two is three.'),
(87, 'sentence_completion', 'easy', 'I have ___ pens in my bag.', 'en', 'three', 'singular', 'I have ___ pens in my bag.', 'I have three pens in my bag.', 2, 'Use "three" to indicate the quantity of 3.'),
(87, 'sentence_completion', 'easy', 'The meeting is at ___ PM.', 'en', 'three', 'singular', 'The meeting is at ___ PM.', 'The meeting is at three PM.', 4, 'Use "three" to indicate the hour.'),
(87, 'sentence_completion', 'easy', '___ of my friends are coming.', 'en', 'Three', 'singular', '___ of my friends are coming.', 'Three of my friends are coming.', 0, 'Use "Three" to count a specific number of people.'),
(87, 'sentence_completion', 'easy', 'A triangle has ___ sides.', 'en', 'three', 'singular', 'A triangle has ___ sides.', 'A triangle has three sides.', 3, 'A triangle is defined by having three sides.'),
(87, 'sentence_completion', 'easy', 'He is ___ years old.', 'en', 'three', 'singular', 'He is ___ years old.', 'He is three years old.', 2, 'Use "three" to state age.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(689, 'واحد'), (689, 'اثنان'), (689, 'أربعة'), (689, 'خمسة'), (689, 'كثير'), (689, 'بعض'), (689, 'كل'), (689, 'أول'), (689, 'ثانٍ'), (689, 'ثالث'),
(690, 'one'), (690, 'two'), (690, 'four'), (690, 'five'), (690, 'many'), (690, 'some'), (690, 'all'), (690, 'first'), (690, 'second'), (690, 'third'),
(691, 'one'), (691, 'two'), (691, 'four'), (691, 'five'), (691, 'many'), (691, 'some'), (691, 'all'), (691, 'first'), (691, 'second'), (691, 'third'),
(692, 'one'), (692, 'two'), (692, 'four'), (692, 'five'), (692, 'many'), (692, 'some'), (692, 'all'), (692, 'first'), (692, 'second'), (692, 'third'),
(693, 'one'), (693, 'two'), (693, 'four'), (693, 'five'), (693, 'many'), (693, 'some'), (693, 'all'), (693, 'first'), (693, 'second'), (693, 'third'),
(694, 'One'), (694, 'Two'), (694, 'Four'), (694, 'Five'), (694, 'Many'), (694, 'Some'), (694, 'All'), (694, 'First'), (694, 'Second'), (694, 'Third'),
(695, 'one'), (695, 'two'), (695, 'four'), (695, 'five'), (695, 'many'), (695, 'some'), (695, 'all'), (695, 'first'), (695, 'second'), (695, 'third'),
(696, 'one'), (696, 'two'), (696, 'four'), (696, 'five'), (696, 'many'), (696, 'some'), (696, 'all'), (696, 'first'), (696, 'second'), (696, 'third');

-- =============================================================================
-- WORD 88: every (ID: 88, POS: det.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (88, 'every', 'كل', 'det.', 'Used to refer to all the individual members of a set without exception.', 'يستخدم للإشارة إلى جميع الأعضاء الفرديين في مجموعة دون استثناء.', 'كل', '["جميع"]', '{"base": "every"}', '/ˈevri/', 'every.mp3', '{"synonyms": ["each", "all"], "antonyms": ["no", "none"], "word_family": ["everyone", "everything", "everywhere"]}', 'Always followed by a singular countable noun.', 'Beginner', 165);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(88, 'I exercise {every} day.', 'أمارس الرياضة كل يوم.', 'every', 'Routine', 'Easy', 1, 1),
(88, '{Every} student must have a book.', 'يجب أن يكون لدى كل طالب كتاب.', 'every', 'Education', 'Easy', 0, 2),
(88, 'I like {every} song on this CD.', 'أحب كل أغنية في هذا القرص المضغوط.', 'every', 'Hobbies', 'Easy', 0, 3),
(88, 'She visits us {every} summer.', 'تزورنا كل صيف.', 'every', 'Routine', 'Easy', 0, 4),
(88, '{Every} person is different.', 'كل شخص مختلف.', 'every', 'General', 'Easy', 0, 5),
(88, 'I hear that {every} time.', 'أسمع ذلك في كل مرة.', 'every', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(88, 'translation_match', 'easy', 'every', 'en', 'كل', 'base', NULL, NULL, NULL, '"every" refers to all members of a group individually.'),
(88, 'reverse_translation', 'easy', 'كل', 'ar', 'every', 'base', NULL, NULL, NULL, 'The Arabic "كل" (followed by singular) translates to "every".'),
(88, 'sentence_completion', 'easy', 'I wake up at 6 AM ___ morning.', 'en', 'every', 'base', 'I wake up at 6 AM ___ morning.', 'I wake up at 6 AM every morning.', 5, 'Use "every" to show a daily routine.'),
(88, 'sentence_completion', 'easy', '___ child needs love.', 'en', 'Every', 'base', '___ child needs love.', 'Every child needs love.', 0, 'Use "Every" before a singular noun to generalize.'),
(88, 'sentence_completion', 'easy', 'He knows ___ word of the song.', 'en', 'every', 'base', 'He knows ___ word of the song.', 'He knows every word of the song.', 2, 'Use "every" to mean all parts of a whole.'),
(88, 'sentence_completion', 'easy', 'We go to the park ___ weekend.', 'en', 'every', 'base', 'We go to the park ___ weekend.', 'We go to the park every weekend.', 5, 'Use "every" to show frequency.'),
(88, 'sentence_completion', 'easy', '___ time I see her, she is happy.', 'en', 'Every', 'base', '___ time I see her, she is happy.', 'Every time I see her, she is happy.', 0, 'Use "Every time" as a conjunction meaning whenever.'),
(88, 'sentence_completion', 'easy', 'I have read ___ book in the library.', 'en', 'every', 'base', 'I have read ___ book in the library.', 'I have read every book in the library.', 3, 'Use "every" to indicate completion of a set.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(697, 'بعض'), (697, 'لا شيء'), (697, 'واحد'), (697, 'قليل'), (697, 'كثير'), (697, 'أي'), (697, 'نفس'), (697, 'آخر'), (697, 'هنا'), (697, 'هناك'),
(698, 'some'), (698, 'no'), (698, 'none'), (698, 'one'), (698, 'many'), (698, 'few'), (698, 'any'), (698, 'only'), (698, 'here'), (698, 'there'),
(699, 'some'), (699, 'all'), (699, 'no'), (699, 'none'), (699, 'many'), (699, 'much'), (699, 'few'), (699, 'little'), (699, 'any'), (699, 'each'),
(700, 'Some'), (700, 'All'), (700, 'No'), (700, 'None'), (700, 'Many'), (700, 'Much'), (700, 'Few'), (700, 'Little'), (700, 'Any'), (700, 'Each'),
(701, 'some'), (701, 'all'), (701, 'no'), (701, 'none'), (701, 'many'), (701, 'much'), (701, 'few'), (701, 'little'), (701, 'any'), (701, 'each'),
(702, 'some'), (702, 'all'), (702, 'no'), (702, 'none'), (702, 'many'), (702, 'much'), (702, 'few'), (702, 'little'), (702, 'any'), (702, 'each'),
(703, 'Some'), (703, 'All'), (703, 'No'), (703, 'None'), (703, 'Many'), (703, 'Much'), (703, 'Few'), (703, 'Little'), (703, 'Any'), (703, 'Each'),
(704, 'some'), (704, 'all'), (704, 'no'), (704, 'none'), (704, 'many'), (704, 'much'), (704, 'few'), (704, 'little'), (704, 'any'), (704, 'each');

-- =============================================================================
-- WORD 89: become (ID: 89, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (89, 'become', 'يصبح', 'v.', 'To begin to be; to grow or come to be.', 'البدء في أن يكون؛ النمو أو الوصول إلى حالة معينة.', 'يصبح', '["يتحول إلى"]', '{"base": "become", "thirdPerson": "becomes", "past": "became", "participle": "become", "gerund": "becoming"}', '/bɪˈkʌm/', 'become.mp3', '{"synonyms": ["grow", "turn into"], "antonyms": ["remain", "stay"], "word_family": []}', 'Irregular verb: become, became, become.', 'Beginner', 167);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(89, 'I want to {become} a doctor.', 'أريد أن أصبح طبيباً.', 'become', 'Career', 'Easy', 1, 1),
(89, 'It {became} very cold at night.', 'أصبح الجو بارداً جداً في الليل.', 'became', 'Weather', 'Easy', 0, 2),
(89, 'She is {becoming} a famous singer.', 'إنها تصبح مغنية مشهورة.', 'becoming', 'Career', 'Easy', 0, 3),
(89, 'He {becomes} angry easily.', 'هو يصبح غاضباً بسهولة.', 'becomes', 'Personality', 'Easy', 0, 4),
(89, 'The leaves {become} yellow in autumn.', 'تصبح الأوراق صفراء في الخريف.', 'become', 'Nature', 'Easy', 0, 5),
(89, 'They have {become} good friends.', 'لقد أصبحوا أصدقاء جيدين.', 'become', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(89, 'translation_match', 'easy', 'become', 'en', 'يصبح', 'base', NULL, NULL, NULL, '"become" is the base verb for a change in state.'),
(89, 'reverse_translation', 'easy', 'يصبح', 'ar', 'become', 'base', NULL, NULL, NULL, 'The Arabic verb "يصبح" translates to "become".'),
(89, 'sentence_completion', 'easy', 'I hope to ___ a pilot.', 'en', 'become', 'base', 'I hope to ___ a pilot.', 'I hope to become a pilot.', 3, 'Use the base form "become" after "to".'),
(89, 'sentence_completion', 'easy', 'He ___ a father last year.', 'en', 'became', 'past', 'He ___ a father last year.', 'He became a father last year.', 1, 'Use "became" for the past tense of "become".'),
(89, 'sentence_completion', 'easy', 'The weather is ___ warmer.', 'en', 'becoming', 'gerund', 'The weather is ___ warmer.', 'The weather is becoming warmer.', 3, 'Use "becoming" for a gradual change in the present.'),
(89, 'sentence_completion', 'easy', 'She ___ quiet when she is sad.', 'en', 'becomes', 'thirdPerson', 'She ___ quiet when she is sad.', 'She becomes quiet when she is sad.', 1, 'Use "becomes" for third-person singular present.'),
(89, 'sentence_completion', 'easy', 'They have ___ very successful.', 'en', 'become', 'participle', 'They have ___ very successful.', 'They have become very successful.', 2, 'Use "become" as the past participle after "have".'),
(89, 'sentence_completion', 'easy', 'It will ___ dark soon.', 'en', 'become', 'base', 'It will ___ dark soon.', 'It will become dark soon.', 2, 'Use the base form "become" after "will".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(705, 'يذهب'), (705, 'يأكل'), (705, 'ينام'), (705, 'يرى'), (705, 'يفعل'), (705, 'يقول'), (705, 'يأخذ'), (705, 'يعطي'), (705, 'يأتي'), (705, 'يصنع'),
(706, 'go'), (706, 'eat'), (706, 'sleep'), (706, 'see'), (706, 'do'), (706, 'say'), (706, 'take'), (706, 'give'), (706, 'come'), (706, 'make'),
(707, 'becomes'), (707, 'became'), (707, 'becoming'), (707, 'goes'), (707, 'went'), (707, 'gone'), (707, 'going'), (707, 'eats'), (707, 'ate'), (707, 'sees'),
(708, 'become'), (708, 'becomes'), (708, 'becoming'), (708, 'go'), (708, 'goes'), (708, 'went'), (708, 'gone'), (708, 'going'), (708, 'eat'), (708, 'ate'),
(709, 'become'), (709, 'becomes'), (709, 'became'), (709, 'go'), (709, 'goes'), (709, 'went'), (709, 'gone'), (709, 'going'), (709, 'eat'), (709, 'ate'),
(710, 'become'), (710, 'became'), (710, 'becoming'), (710, 'go'), (710, 'goes'), (710, 'went'), (710, 'gone'), (710, 'going'), (710, 'eat'), (710, 'ate'),
(711, 'becomes'), (711, 'became'), (711, 'becoming'), (711, 'go'), (711, 'goes'), (711, 'went'), (711, 'gone'), (711, 'going'), (711, 'eat'), (711, 'ate'),
(712, 'becomes'), (712, 'became'), (712, 'becoming'), (712, 'go'), (712, 'goes'), (712, 'went'), (712, 'gone'), (712, 'going'), (712, 'eat'), (712, 'ate');

-- =============================================================================
-- WORD 90: between (ID: 90, POS: prep.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (90, 'between', 'بين', 'prep.', 'In the space separating two objects or regions.', 'في المساحة التي تفصل بين كائنين أو منطقتين.', 'بين', '["وسط"]', '{"base": "between"}', '/bɪˈtwiːn/', 'between.mp3', '{"synonyms": ["amid", "among"], "antonyms": [], "word_family": []}', 'Usually used for two distinct items.', 'Beginner', 169);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(90, 'The ball is {between} the two boxes.', 'الكرة بين الصندوقين.', 'between', 'Location', 'Easy', 1, 1),
(90, 'I am sitting {between} Ahmed and Ali.', 'أنا جالس بين أحمد وعلي.', 'between', 'Social', 'Easy', 0, 2),
(90, 'The meeting is {between} 2 and 3 PM.', 'الاجتماع بين الساعة 2 و 3 مساءً.', 'between', 'Time', 'Easy', 0, 3),
(90, 'There is a secret {between} us.', 'هناك سر بيننا.', 'between', 'Social', 'Easy', 0, 4),
(90, 'The shop is {between} the bank and the pharmacy.', 'المحل يقع بين البنك والصيدلية.', 'between', 'Location', 'Easy', 0, 5),
(90, 'Choose {between} these two colors.', 'اختر بين هذين اللونين.', 'between', 'Choices', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(90, 'translation_match', 'easy', 'between', 'en', 'بين', 'base', NULL, NULL, NULL, '"between" indicates a position in the middle of two things.'),
(90, 'reverse_translation', 'easy', 'بين', 'ar', 'between', 'base', NULL, NULL, NULL, 'The Arabic "بين" translates to "between" in English.'),
(90, 'sentence_completion', 'easy', 'The letter B is ___ A and C.', 'en', 'between', 'base', 'The letter B is ___ A and C.', 'The letter B is between A and C.', 4, 'Use "between" to show position in a sequence of two.'),
(90, 'sentence_completion', 'easy', 'I can''t decide ___ the red or blue one.', 'en', 'between', 'base', 'I can''t decide ___ the red or blue one.', 'I can''t decide between the red or blue one.', 3, 'Use "between" when choosing from two options.'),
(90, 'sentence_completion', 'easy', 'The cat is hiding ___ the chairs.', 'en', 'between', 'base', 'The cat is hiding ___ the chairs.', 'The cat is hiding between the chairs.', 4, 'Use "between" for space separating two objects.'),
(90, 'sentence_completion', 'easy', 'Lunch is ___ 12:00 and 1:00.', 'en', 'between', 'base', 'Lunch is ___ 12:00 and 1:00.', 'Lunch is between 12:00 and 1:00.', 2, 'Use "between" to show a time range.'),
(90, 'sentence_completion', 'easy', 'There is a fence ___ the two houses.', 'en', 'between', 'base', 'There is a fence ___ the two houses.', 'There is a fence between the two houses.', 4, 'Use "between" to show separation.'),
(90, 'sentence_completion', 'easy', 'Keep this ___ you and me.', 'en', 'between', 'base', 'Keep this ___ you and me.', 'Keep this between you and me.', 2, 'Common phrase meaning to keep a secret.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(713, 'تحت'), (713, 'فوق'), (713, 'بجانب'), (713, 'خلف'), (713, 'أمام'), (713, 'مع'), (713, 'من'), (713, 'إلى'), (713, 'في'), (713, 'على'),
(714, 'under'), (714, 'over'), (714, 'beside'), (714, 'behind'), (714, 'front'), (714, 'with'), (714, 'from'), (714, 'to'), (714, 'in'), (714, 'on'),
(715, 'under'), (715, 'over'), (715, 'beside'), (715, 'behind'), (715, 'front'), (715, 'with'), (715, 'from'), (715, 'to'), (715, 'in'), (715, 'on'),
(716, 'under'), (716, 'over'), (716, 'beside'), (716, 'behind'), (716, 'front'), (716, 'with'), (716, 'from'), (716, 'to'), (716, 'in'), (716, 'on'),
(717, 'under'), (717, 'over'), (717, 'beside'), (717, 'behind'), (717, 'front'), (717, 'with'), (717, 'from'), (717, 'to'), (717, 'in'), (717, 'on'),
(718, 'under'), (718, 'over'), (718, 'beside'), (718, 'behind'), (718, 'front'), (718, 'with'), (718, 'from'), (718, 'to'), (718, 'in'), (718, 'on'),
(719, 'under'), (719, 'over'), (719, 'beside'), (719, 'behind'), (719, 'front'), (719, 'with'), (719, 'from'), (719, 'to'), (719, 'in'), (719, 'on'),
(720, 'under'), (720, 'over'), (720, 'beside'), (720, 'behind'), (720, 'front'), (720, 'with'), (720, 'from'), (720, 'to'), (720, 'in'), (720, 'on');

-- =============================================================================
-- WORD 91: happen (ID: 91, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (91, 'happen', 'يحدث', 'v.', 'To take place; to occur.', 'أن يقع؛ أن يحدث.', 'يحدث', '["يصير", "يقع"]', '{"base": "happen", "thirdPerson": "happens", "past": "happened", "participle": "happened", "gerund": "happening"}', '/ˈhæpən/', 'happen.mp3', '{"synonyms": ["occur", "take place"], "antonyms": [], "word_family": ["happening"]}', 'Commonly used to ask about events or situations.', 'Beginner', 170);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(91, 'What did {happen}?', 'ماذا حدث؟', 'happen', 'Inquiry', 'Easy', 1, 1),
(91, 'Accidents {happen} every day.', 'الحوادث تقع كل يوم.', 'happen', 'General', 'Easy', 0, 2),
(91, 'It {happens} to the best of us.', 'يحدث هذا لأفضلنا.', 'happens', 'Social', 'Easy', 0, 3),
(91, 'Something strange {happened} last night.', 'حدث شيء غريب ليلة أمس.', 'happened', 'Past Events', 'Easy', 0, 4),
(91, 'What is {happening} here?', 'ماذا يحدث هنا؟', 'happening', 'Current Action', 'Easy', 0, 5),
(91, 'I don''t want this to {happen} again.', 'لا أريد أن يحدث هذا مرة أخرى.', 'happen', 'Instruction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(91, 'translation_match', 'easy', 'happen', 'en', 'يحدث', 'base', NULL, NULL, NULL, '"happen" is the base verb for an event taking place.'),
(91, 'reverse_translation', 'easy', 'يحدث', 'ar', 'happen', 'base', NULL, NULL, NULL, 'The Arabic verb "يحدث" translates to "happen".'),
(91, 'sentence_completion', 'easy', 'Did you see what ___?', 'en', 'happened', 'past', 'Did you see what ___?', 'Did you see what happened?', 4, 'Use "happened" for a past event.'),
(91, 'sentence_completion', 'easy', 'It ___ all the time.', 'en', 'happens', 'thirdPerson', 'It ___ all the time.', 'It happens all the time.', 1, 'Use "happens" for third-person singular present.'),
(91, 'sentence_completion', 'easy', 'I wonder what will ___ next.', 'en', 'happen', 'base', 'I wonder what will ___ next.', 'I wonder what will happen next.', 4, 'Use the base form "happen" after "will".'),
(91, 'sentence_completion', 'easy', 'A lot is ___ in the world right now.', 'en', 'happening', 'gerund', 'A lot is ___ in the world right now.', 'A lot is happening in the world right now.', 2, 'Use "happening" for the present continuous.'),
(91, 'sentence_completion', 'easy', 'How did this ___?', 'en', 'happen', 'base', 'How did this ___?', 'How did this happen?', 3, 'Use the base form "happen" after "did".'),
(91, 'sentence_completion', 'easy', 'I don''t want it to ___ again.', 'en', 'happen', 'base', 'I don''t want it to ___ again.', 'I don''t want it to happen again.', 5, 'Use the base form "happen" after "to".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(721, 'يذهب'), (721, 'يأكل'), (721, 'ينام'), (721, 'يرى'), (721, 'يفعل'), (721, 'يقول'), (721, 'يأخذ'), (721, 'يعطي'), (721, 'يأتي'), (721, 'يصنع'),
(722, 'go'), (722, 'eat'), (722, 'sleep'), (722, 'see'), (722, 'do'), (722, 'say'), (722, 'take'), (722, 'give'), (722, 'come'), (722, 'make'),
(723, 'happen'), (723, 'happens'), (723, 'happening'), (723, 'goes'), (723, 'went'), (723, 'gone'), (723, 'going'), (723, 'sees'), (723, 'saw'), (723, 'seen'),
(724, 'happen'), (724, 'happened'), (724, 'happening'), (724, 'goes'), (724, 'went'), (724, 'gone'), (724, 'going'), (724, 'sees'), (724, 'saw'), (724, 'seen'),
(725, 'happens'), (725, 'happened'), (725, 'happening'), (725, 'goes'), (725, 'went'), (725, 'gone'), (725, 'going'), (725, 'sees'), (725, 'saw'), (725, 'seen'),
(726, 'happen'), (726, 'happens'), (726, 'happened'), (726, 'goes'), (726, 'went'), (726, 'gone'), (726, 'going'), (726, 'sees'), (726, 'saw'), (726, 'seen'),
(727, 'happens'), (727, 'happened'), (727, 'happening'), (727, 'goes'), (727, 'went'), (727, 'gone'), (727, 'going'), (727, 'sees'), (727, 'saw'), (727, 'seen'),
(728, 'happens'), (728, 'happened'), (728, 'happening'), (728, 'goes'), (728, 'went'), (728, 'gone'), (728, 'going'), (728, 'sees'), (728, 'saw'), (728, 'seen');

-- =============================================================================
-- WORD 92: family (ID: 92, POS: n., adj.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (92, 'family', 'عائلة', 'n., adj.', 'A group of people related by blood or marriage.', 'مجموعة من الأشخاص تربطهم صلة الدم أو الزواج.', 'عائلة', '["أسرة"]', '{"singular": "family", "plural": "families"}', '/ˈfæmili/', 'family.mp3', '{"synonyms": ["household", "relatives"], "antonyms": [], "word_family": ["familiar"]}', 'Can be used as a noun or an adjective (e.g., family car).', 'Beginner', 171);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(92, 'I love my {family}.', 'أنا أحب عائلتي.', 'family', 'Personal', 'Easy', 1, 1),
(92, 'How is your {family}?', 'كيف حال عائلتك؟', 'family', 'Social', 'Easy', 0, 2),
(92, 'We are a big {family}.', 'نحن عائلة كبيرة.', 'family', 'Family', 'Easy', 0, 3),
(92, 'Many {families} live in this building.', 'تعيش العديد من العائلات في هذا المبنى.', 'families', 'General', 'Easy', 0, 4),
(92, 'It is a {family} business.', 'إنه عمل عائلي.', 'family', 'Business', 'Easy', 0, 5),
(92, 'I have a {family} dinner tonight.', 'لدي عشاء عائلي الليلة.', 'family', 'Social', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(92, 'translation_match', 'easy', 'family', 'en', 'عائلة', 'singular', NULL, NULL, NULL, '"family" refers to a group of related people.'),
(92, 'reverse_translation', 'easy', 'عائلة', 'ar', 'family', 'singular', NULL, NULL, NULL, 'The Arabic "عائلة" translates to "family" in English.'),
(92, 'sentence_completion', 'easy', 'He has a very large ___ .', 'en', 'family', 'singular', 'He has a very large ___ .', 'He has a very large family.', 5, 'Use "family" to describe a group of relatives.'),
(92, 'sentence_completion', 'easy', 'All the ___ are invited.', 'en', 'families', 'plural', 'All the ___ are invited.', 'All the families are invited.', 2, 'Use "families" for more than one group.'),
(92, 'sentence_completion', 'easy', 'This is a ___ photo.', 'en', 'family', 'adj.', 'This is a ___ photo.', 'This is a family photo.', 3, 'Use "family" as an adjective to describe the photo.'),
(92, 'sentence_completion', 'easy', 'I spend time with my ___ on weekends.', 'en', 'family', 'singular', 'I spend time with my ___ on weekends.', 'I spend time with my family on weekends.', 5, 'Use "family" to refer to relatives.'),
(92, 'sentence_completion', 'easy', 'They are like ___ to me.', 'en', 'family', 'singular', 'They are like ___ to me.', 'They are like family to me.', 3, 'Use "family" to describe a close relationship.'),
(92, 'sentence_completion', 'easy', '___ values are important.', 'en', 'Family', 'adj.', '___ values are important.', 'Family values are important.', 0, 'Use "Family" as an adjective at the start of the sentence.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(729, 'أصدقاء'), (729, 'ناس'), (729, 'عمل'), (729, 'مدرسة'), (729, 'بيت'), (729, 'مدينة'), (729, 'وقت'), (729, 'يوم'), (729, 'سنة'), (729, 'اسم'),
(730, 'friends'), (730, 'people'), (730, 'work'), (730, 'school'), (730, 'house'), (730, 'city'), (730, 'time'), (730, 'day'), (730, 'year'), (730, 'name'),
(731, 'friends'), (731, 'people'), (731, 'work'), (731, 'school'), (731, 'house'), (731, 'city'), (731, 'time'), (731, 'day'), (731, 'year'), (731, 'name'),
(732, 'family', 'friends', 'people', 'work', 'school', 'house', 'city', 'time', 'day', 'year'),
(733, 'friends', 'people', 'work', 'school', 'house', 'city', 'time', 'day', 'year', 'name'),
(734, 'friends', 'people', 'work', 'school', 'house', 'city', 'time', 'day', 'year', 'name'),
(735, 'friends', 'people', 'work', 'school', 'house', 'city', 'time', 'day', 'year', 'name'),
(736, 'Friends', 'People', 'Work', 'School', 'House', 'City', 'Time', 'Day', 'Year', 'Name');

-- =============================================================================
-- WORD 93: over (ID: 93, POS: prep., adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (93, 'over', 'فوق / عبر', 'prep., adv.', 'Extending directly upward from; or across a space.', 'يمتد مباشرة إلى الأعلى من؛ أو عبر مساحة.', 'فوق / عبر', '["انتهى", "أكثر من"]', '{"base": "over"}', '/ˈoʊvər/', 'over.mp3', '{"synonyms": ["above", "across", "finished"], "antonyms": ["under", "below"], "word_family": []}', 'Can be a preposition, adverb, or adjective.', 'Beginner', 172);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(93, 'The bird flew {over} the house.', 'طار الطائر فوق المنزل.', 'over', 'Nature', 'Easy', 1, 1),
(93, 'The game is {over}.', 'انتهت اللعبة.', 'over', 'Games', 'Easy', 0, 2),
(93, 'Come {over} to my place.', 'تعال إلى منزلي.', 'over', 'Social', 'Easy', 0, 3),
(93, 'He is {over} fifty years old.', 'عمره أكثر من خمسين عاماً.', 'over', 'Age', 'Easy', 0, 4),
(93, 'The bridge goes {over} the river.', 'الجسر يمر فوق النهر.', 'over', 'Travel', 'Easy', 0, 5),
(93, 'Look {over} there!', 'انظر هناك!', 'over', 'Direction', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(93, 'translation_match', 'easy', 'over', 'en', 'فوق / عبر', 'base', NULL, NULL, NULL, '"over" can mean above something or that something is finished.'),
(93, 'reverse_translation', 'easy', 'فوق / عبر', 'ar', 'over', 'base', NULL, NULL, NULL, 'The Arabic "فوق" or "عبر" translates to "over".'),
(93, 'sentence_completion', 'easy', 'Jump ___ the fence.', 'en', 'over', 'base', 'Jump ___ the fence.', 'Jump over the fence.', 1, 'Use "over" to show movement across the top of something.'),
(93, 'sentence_completion', 'easy', 'School is ___ for the summer.', 'en', 'over', 'base', 'School is ___ for the summer.', 'School is over for the summer.', 2, 'Use "over" to mean finished.'),
(93, 'sentence_completion', 'easy', 'There are ___ twenty students.', 'en', 'over', 'base', 'There are ___ twenty students.', 'There are over twenty students.', 2, 'Use "over" to mean "more than".'),
(93, 'sentence_completion', 'easy', 'Put the blanket ___ the bed.', 'en', 'over', 'base', 'Put the blanket ___ the bed.', 'Put the blanket over the bed.', 3, 'Use "over" to mean covering something.'),
(93, 'sentence_completion', 'easy', 'He fell ___ the chair.', 'en', 'over', 'base', 'He fell ___ the chair.', 'He fell over the chair.', 2, 'Use "over" to show falling across something.'),
(93, 'sentence_completion', 'easy', 'The plane is flying ___ the city.', 'en', 'over', 'base', 'The plane is flying ___ the city.', 'The plane is flying over the city.', 4, 'Use "over" to mean above.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(737, 'تحت'), (737, 'أسفل'), (737, 'بجانب'), (737, 'خلف'), (737, 'أمام'), (737, 'مع'), (737, 'من'), (737, 'إلى'), (737, 'في'), (737, 'على'),
(738, 'under'), (738, 'below'), (738, 'beside'), (738, 'behind'), (738, 'front'), (738, 'with'), (738, 'from'), (738, 'to'), (738, 'in'), (738, 'on'),
(739, 'under'), (739, 'below'), (739, 'beside'), (739, 'behind'), (739, 'front'), (739, 'with'), (739, 'from'), (739, 'to'), (739, 'in'), (739, 'on'),
(740, 'under'), (740, 'below'), (740, 'beside'), (740, 'behind'), (740, 'front'), (740, 'with'), (740, 'from'), (740, 'to'), (740, 'in'), (740, 'on'),
(741, 'under'), (741, 'below'), (741, 'beside'), (741, 'behind'), (741, 'front'), (741, 'with'), (741, 'from'), (741, 'to'), (741, 'in'), (741, 'on'),
(742, 'under'), (742, 'below'), (742, 'beside'), (742, 'behind'), (742, 'front'), (742, 'with'), (742, 'from'), (742, 'to'), (742, 'in'), (742, 'on'),
(743, 'under'), (743, 'below'), (743, 'beside'), (743, 'behind'), (743, 'front'), (743, 'with'), (743, 'from'), (743, 'to'), (743, 'in'), (743, 'on'),
(744, 'under'), (744, 'below'), (744, 'beside'), (744, 'behind'), (744, 'front'), (744, 'with'), (744, 'from'), (744, 'to'), (744, 'in'), (744, 'on');

-- =============================================================================
-- WORD 94: old (ID: 94, POS: adj.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (94, 'old', 'قديم / كبير في السن', 'adj.', 'Having lived for a long time; or made long ago.', 'عاش لفترة طويلة؛ أو صُنع منذ زمن بعيد.', 'قديم / كبير في السن', '["مسن", "عتيق"]', '{"base": "old", "comparative": "older", "superlative": "oldest"}', '/oʊld/', 'old.mp3', '{"synonyms": ["aged", "ancient"], "antonyms": ["new", "young"], "word_family": []}', 'Used for both people (age) and objects (time since creation).', 'Beginner', 174);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(94, 'How {old} are you?', 'كم عمرك؟', 'old', 'Age', 'Easy', 1, 1),
(94, 'This is an {old} book.', 'هذا كتاب قديم.', 'old', 'General', 'Easy', 0, 2),
(94, 'My grandfather is very {old}.', 'جدي كبير جداً في السن.', 'old', 'Age', 'Easy', 0, 3),
(94, 'He is {older} than me.', 'هو أكبر مني سناً.', 'older', 'Comparison', 'Easy', 0, 4),
(94, 'This is the {oldest} house in town.', 'هذا أقدم منزل في المدينة.', 'oldest', 'Comparison', 'Easy', 0, 5),
(94, 'I like {old} movies.', 'أنا أحب الأفلام القديمة.', 'old', 'Entertainment', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(94, 'translation_match', 'easy', 'old', 'en', 'قديم / كبير في السن', 'base', NULL, NULL, NULL, '"old" is used for age or long-existing things.'),
(94, 'reverse_translation', 'easy', 'قديم', 'ar', 'old', 'base', NULL, NULL, NULL, 'The Arabic "قديم" translates to "old" in English.'),
(94, 'sentence_completion', 'easy', 'I am ten years ___ .', 'en', 'old', 'base', 'I am ten years ___ .', 'I am ten years old.', 4, 'Use "old" after years to state age.'),
(94, 'sentence_completion', 'easy', 'She is ___ than her sister.', 'en', 'older', 'comparative', 'She is ___ than her sister.', 'She is older than her sister.', 2, 'Use "older" to compare the age of two people.'),
(94, 'sentence_completion', 'easy', 'This is a very ___ building.', 'en', 'old', 'base', 'This is a very ___ building.', 'This is a very old building.', 4, 'Use "old" to describe something made long ago.'),
(94, 'sentence_completion', 'easy', 'He is the ___ man in the village.', 'en', 'oldest', 'superlative', 'He is the ___ man in the village.', 'He is the oldest man in the village.', 3, 'Use "oldest" to indicate the highest age.'),
(94, 'sentence_completion', 'easy', 'I have an ___ car.', 'en', 'old', 'base', 'I have an ___ car.', 'I have an old car.', 3, 'Use "old" to describe a car that is not new.'),
(94, 'sentence_completion', 'easy', 'The ___ ways are sometimes best.', 'en', 'old', 'base', 'The ___ ways are sometimes best.', 'The old ways are sometimes best.', 1, 'Use "old" to refer to traditions or past methods.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(745, 'جديد'), (745, 'شاب'), (745, 'كبير'), (745, 'صغير'), (745, 'سريع'), (745, 'بطيء'), (745, 'جيد'), (745, 'سيء'), (745, 'حار'), (745, 'بارد'),
(746, 'new'), (746, 'young'), (746, 'big'), (746, 'small'), (746, 'fast'), (746, 'slow'), (746, 'good'), (746, 'bad'), (746, 'hot'), (746, 'cold'),
(747, 'new'), (747, 'young'), (747, 'big'), (747, 'small'), (747, 'fast'), (747, 'slow'), (747, 'good'), (747, 'bad'), (747, 'hot'), (747, 'cold'),
(748, 'old'), (748, 'older'), (748, 'new'), (748, 'newer'), (748, 'young'), (748, 'younger'), (748, 'big'), (748, 'bigger'), (748, 'small'), (748, 'smaller'),
(749, 'new'), (749, 'young'), (749, 'big'), (749, 'small'), (749, 'fast'), (749, 'slow'), (749, 'good'), (749, 'bad'), (749, 'hot'), (749, 'cold'),
(750, 'old'), (750, 'older'), (750, 'oldest'), (750, 'new'), (750, 'newer'), (750, 'newest'), (750, 'young'), (750, 'younger'), (750, 'youngest'), (750, 'big'),
(751, 'new'), (751, 'young'), (751, 'big'), (751, 'small'), (751, 'fast'), (751, 'slow'), (751, 'good'), (751, 'bad'), (751, 'hot'), (751, 'cold'),
(752, 'new'), (752, 'young'), (752, 'big'), (752, 'small'), (752, 'fast'), (752, 'slow'), (752, 'good'), (752, 'bad'), (752, 'hot'), (752, 'cold');

-- =============================================================================
-- WORD 95: yes (ID: 95, POS: exclam.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (95, 'yes', 'نعم', 'exclam.', 'Used to give an affirmative response.', 'يستخدم لإعطاء رد إيجابي.', 'نعم', '["أجل"]', '{"base": "yes"}', '/jes/', 'yes.mp3', '{"synonyms": ["yeah", "yep"], "antonyms": ["no"], "word_family": []}', 'The standard affirmative answer in English.', 'Beginner', 175);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(95, '{Yes}, I am ready.', 'نعم، أنا مستعد.', 'yes', 'Social', 'Easy', 1, 1),
(95, 'He said {yes} to the offer.', 'قال نعم للعرض.', 'yes', 'Social', 'Easy', 0, 2),
(95, '{Yes}, please.', 'نعم، من فضلك.', 'yes', 'Requests', 'Easy', 0, 3),
(95, 'Are you coming? - {Yes}.', 'هل أنت قادم؟ - نعم.', 'yes', 'Conversation', 'Easy', 0, 4),
(95, 'Oh {yes}, I remember now.', 'أوه نعم، أتذكر الآن.', 'yes', 'Realization', 'Easy', 0, 5),
(95, '{Yes}, that is correct.', 'نعم، هذا صحيح.', 'yes', 'Agreement', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(95, 'translation_match', 'easy', 'yes', 'en', 'نعم', 'base', NULL, NULL, NULL, '"yes" is the standard affirmative response.'),
(95, 'reverse_translation', 'easy', 'نعم', 'ar', 'yes', 'base', NULL, NULL, NULL, 'The Arabic "نعم" translates to "yes" in English.'),
(95, 'sentence_completion', 'easy', '___ , I would love some tea.', 'en', 'Yes', 'base', '___ , I would love some tea.', 'Yes, I would love some tea.', 0, 'Use "Yes" to accept an offer.'),
(95, 'sentence_completion', 'easy', 'Did you finish? - ___ .', 'en', 'Yes', 'base', 'Did you finish? - ___ .', 'Did you finish? - Yes.', 5, 'Use "Yes" to answer a question affirmatively.'),
(95, 'sentence_completion', 'easy', '___ , that is my car.', 'en', 'Yes', 'base', '___ , that is my car.', 'Yes, that is my car.', 0, 'Use "Yes" to confirm a statement.'),
(95, 'sentence_completion', 'easy', 'Please say ___ or no.', 'en', 'yes', 'base', 'Please say ___ or no.', 'Please say yes or no.', 2, 'Use "yes" as the opposite of "no".'),
(95, 'sentence_completion', 'easy', '___ , I can help you.', 'en', 'Yes', 'base', '___ , I can help you.', 'Yes, I can help you.', 0, 'Use "Yes" to agree to a request.'),
(95, 'sentence_completion', 'easy', 'Is it raining? - ___ , it is.', 'en', 'Yes', 'base', 'Is it raining? - ___ , it is.', 'Is it raining? - Yes, it is.', 5, 'Use "Yes" to confirm a current state.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(753, 'لا'), (753, 'ربما'), (753, 'أبداً'), (753, 'شكراً'), (753, 'عفواً'), (753, 'من'), (753, 'إلى'), (753, 'في'), (753, 'على'), (753, 'مع'),
(754, 'no'), (754, 'maybe'), (754, 'never'), (754, 'not'), (754, 'thanks'), (754, 'please'), (754, 'sorry'), (754, 'from'), (754, 'to'), (754, 'in'),
(755, 'No'), (755, 'Maybe'), (755, 'Never'), (755, 'Not'), (755, 'Thanks'), (755, 'Please'), (755, 'Sorry'), (755, 'From'), (755, 'To'), (755, 'In'),
(756, 'No'), (756, 'Maybe'), (756, 'Never'), (756, 'Not'), (756, 'Thanks'), (756, 'Please'), (756, 'Sorry'), (756, 'From'), (756, 'To'), (756, 'In'),
(757, 'No'), (757, 'Maybe'), (757, 'Never'), (757, 'Not'), (757, 'Thanks'), (757, 'Please'), (757, 'Sorry'), (757, 'From'), (757, 'To'), (757, 'In'),
(758, 'no'), (758, 'maybe'), (758, 'never'), (758, 'not'), (758, 'thanks'), (758, 'please'), (758, 'sorry'), (758, 'from'), (758, 'to'), (758, 'in'),
(759, 'No'), (759, 'Maybe'), (759, 'Never'), (759, 'Not'), (759, 'Thanks'), (759, 'Please'), (759, 'Sorry'), (759, 'From'), (759, 'To'), (759, 'In'),
(760, 'No'), (760, 'Maybe'), (760, 'Never'), (760, 'Not'), (760, 'Thanks'), (760, 'Please'), (760, 'Sorry'), (760, 'From'), (760, 'To'), (760, 'In');

-- =============================================================================
-- WORD 96: again (ID: 96, POS: adv.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (96, 'again', 'مرة أخرى', 'adv.', 'Another time; once more.', 'مرة أخرى؛ من جديد.', 'مرة أخرى', '["مجدداً", "أيضاً"]', '{"base": "again"}', '/əˈɡen/', 'again.mp3', '{"synonyms": ["once more", "anew"], "antonyms": [], "word_family": []}', 'Used to indicate the repetition of an action or state.', 'Beginner', 178);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(96, 'Please say that {again}.', 'من فضلك قل ذلك مرة أخرى.', 'again', 'Communication', 'Easy', 1, 1),
(96, 'Try {again} until you succeed.', 'حاول مرة أخرى حتى تنجح.', 'again', 'Advice', 'Easy', 0, 2),
(96, 'I am happy to see you {again}.', 'أنا سعيد برؤيتك مرة أخرى.', 'again', 'Social', 'Easy', 0, 3),
(96, 'It is raining {again}.', 'إنها تمطر مرة أخرى.', 'again', 'Weather', 'Easy', 0, 4),
(96, 'Never {again} will I do that.', 'لن أفعل ذلك مرة أخرى أبداً.', 'again', 'General', 'Easy', 0, 5),
(96, 'Call me {again} tomorrow.', 'اتصل بي مرة أخرى غداً.', 'again', 'Communication', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(96, 'translation_match', 'easy', 'again', 'en', 'مرة أخرى', 'base', NULL, NULL, NULL, '"again" means one more time.'),
(96, 'reverse_translation', 'easy', 'مرة أخرى', 'ar', 'again', 'base', NULL, NULL, NULL, 'The Arabic "مرة أخرى" translates to "again" in English.'),
(96, 'sentence_completion', 'easy', 'Can you repeat that ___?', 'en', 'again', 'base', 'Can you repeat that ___?', 'Can you repeat that again?', 4, 'Use "again" to ask for a repetition.'),
(96, 'sentence_completion', 'easy', 'I failed, but I will try ___ .', 'en', 'again', 'base', 'I failed, but I will try ___ .', 'I failed, but I will try again.', 6, 'Use "again" to show a repeated attempt.'),
(96, 'sentence_completion', 'easy', 'Nice to see you ___ .', 'en', 'again', 'base', 'Nice to see you ___ .', 'Nice to see you again.', 4, 'Common phrase used when meeting someone for the second time.'),
(96, 'sentence_completion', 'easy', 'Don''t do that ___ .', 'en', 'again', 'base', 'Don''t do that ___ .', 'Don''t do that again.', 3, 'Use "again" to warn against repeating an action.'),
(96, 'sentence_completion', 'easy', 'It happened ___ .', 'en', 'again', 'base', 'It happened ___ .', 'It happened again.', 2, 'Use "again" to show that an event occurred once more.'),
(96, 'sentence_completion', 'easy', 'Home ___ !', 'en', 'again', 'base', 'Home ___ !', 'Home again!', 1, 'Common expression used when returning home.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(761, 'الآن'), (761, 'هنا'), (761, 'هناك'), (761, 'أبداً'), (761, 'دائماً'), (761, 'فقط'), (761, 'أيضاً'), (761, 'جداً'), (761, 'قبل'), (761, 'بعد'),
(762, 'now'), (762, 'here'), (762, 'there'), (762, 'never'), (762, 'always'), (762, 'only'), (762, 'also'), (762, 'very'), (762, 'before'), (762, 'after'),
(763, 'now'), (763, 'here'), (763, 'there'), (763, 'never'), (763, 'always'), (763, 'only'), (763, 'also'), (763, 'very'), (763, 'before'), (763, 'after'),
(764, 'now'), (764, 'here'), (764, 'there'), (764, 'never'), (764, 'always'), (764, 'only'), (764, 'also'), (764, 'very'), (764, 'before'), (764, 'after'),
(765, 'now'), (765, 'here'), (765, 'there'), (765, 'never'), (765, 'always'), (765, 'only'), (765, 'also'), (765, 'very'), (765, 'before'), (765, 'after'),
(766, 'now'), (766, 'here'), (766, 'there'), (766, 'never'), (766, 'always'), (766, 'only'), (766, 'also'), (766, 'very'), (766, 'before'), (766, 'after'),
(767, 'now'), (767, 'here'), (767, 'there'), (767, 'never'), (767, 'always'), (767, 'only'), (767, 'also'), (767, 'very'), (767, 'before'), (767, 'after'),
(768, 'now'), (768, 'here'), (768, 'there'), (768, 'never'), (768, 'always'), (768, 'only'), (768, 'also'), (768, 'very'), (768, 'before'), (768, 'after');

-- =============================================================================
-- WORD 97: student (ID: 97, POS: n.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (97, 'student', 'طالب', 'n.', 'A person who is studying at a school or college.', 'شخص يدرس في مدرسة أو كلية.', 'طالب', '["تلميذ"]', '{"singular": "student", "plural": "students"}', '/ˈstuːdnt/', 'student.mp3', '{"synonyms": ["pupil", "learner"], "antonyms": ["teacher"], "word_family": ["study"]}', 'Used for anyone engaged in learning at an institution.', 'Beginner', 179);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(97, 'I am a {student}.', 'أنا طالب.', 'student', 'Identity', 'Easy', 1, 1),
(97, 'The {students} are in the classroom.', 'الطلاب في الفصل.', 'students', 'Education', 'Easy', 0, 2),
(97, 'She is a good {student}.', 'هي طالبة جيدة.', 'student', 'Education', 'Easy', 0, 3),
(97, 'He is a university {student}.', 'هو طالب جامعي.', 'student', 'Education', 'Easy', 0, 4),
(97, 'How many {students} are in your class?', 'كم عدد الطلاب في فصلك؟', 'students', 'Quantity', 'Easy', 0, 5),
(97, 'Every {student} needs a pen.', 'كل طالب يحتاج إلى قلم.', 'student', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(97, 'translation_match', 'easy', 'student', 'en', 'طالب', 'singular', NULL, NULL, NULL, '"student" is a person who learns at a school.'),
(97, 'reverse_translation', 'easy', 'طالب', 'ar', 'student', 'singular', NULL, NULL, NULL, 'The Arabic "طالب" translates to "student" in English.'),
(97, 'sentence_completion', 'easy', 'He is a medical ___ .', 'en', 'student', 'singular', 'He is a medical ___ .', 'He is a medical student.', 4, 'Use "student" to describe someone studying medicine.'),
(97, 'sentence_completion', 'easy', 'The ___ are quiet during the test.', 'en', 'students', 'plural', 'The ___ are quiet during the test.', 'The students are quiet during the test.', 1, 'Use "students" for a plural group of learners.'),
(97, 'sentence_completion', 'easy', 'I was a ___ ten years ago.', 'en', 'student', 'singular', 'I was a ___ ten years ago.', 'I was a student ten years ago.', 3, 'Use "student" to refer to a past role in education.'),
(97, 'sentence_completion', 'easy', 'She is the best ___ in the school.', 'en', 'student', 'singular', 'She is the best ___ in the school.', 'She is the best student in the school.', 4, 'Use "student" to refer to a single learner.'),
(97, 'sentence_completion', 'easy', 'Are you a ___ here?', 'en', 'student', 'singular', 'Are you a ___ here?', 'Are you a student here?', 3, 'Use "student" to ask about someone''s educational status.'),
(97, 'sentence_completion', 'easy', 'Many ___ study at night.', 'en', 'students', 'plural', 'Many ___ study at night.', 'Many students study at night.', 1, 'Use "students" after "many" for plural learners.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(769, 'معلم'), (769, 'طبيب'), (769, 'مهندس'), (769, 'رجل'), (769, 'امرأة'), (769, 'طفل'), (769, 'مدرسة'), (769, 'بيت'), (769, 'عمل'), (769, 'كتاب'),
(770, 'teacher'), (770, 'doctor'), (770, 'engineer'), (770, 'man'), (770, 'woman'), (770, 'child'), (770, 'school'), (770, 'house'), (770, 'work'), (770, 'book'),
(771, 'teacher'), (771, 'doctor'), (771, 'engineer'), (771, 'man'), (771, 'woman'), (771, 'child'), (771, 'school'), (771, 'house'), (771, 'work'), (771, 'book'),
(772, 'student'), (772, 'teacher'), (772, 'teachers'), (772, 'doctor'), (772, 'doctors'), (772, 'man'), (772, 'men'), (772, 'school'), (772, 'schools'), (772, 'work'),
(773, 'teacher'), (773, 'doctor'), (773, 'engineer'), (773, 'man'), (773, 'woman'), (773, 'child'), (773, 'school'), (773, 'house'), (773, 'work'), (773, 'book'),
(774, 'teacher'), (774, 'doctor'), (774, 'engineer'), (774, 'man'), (774, 'woman'), (774, 'child'), (774, 'school'), (774, 'house'), (774, 'work'), (774, 'book'),
(775, 'teacher'), (775, 'doctor'), (775, 'engineer'), (775, 'man'), (775, 'woman'), (775, 'child'), (775, 'school'), (775, 'house'), (775, 'work'), (775, 'book'),
(776, 'student'), (776, 'teacher'), (776, 'teachers'), (776, 'doctor'), (776, 'doctors'), (776, 'man'), (776, 'men'), (776, 'school'), (776, 'schools'), (776, 'work');

-- =============================================================================
-- WORD 98: so (ID: 98, POS: adv., conj.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (98, 'so', 'لذلك / جداً', 'adv., conj.', 'To such a great extent; or for that reason.', 'إلى حد كبير؛ أو لهذا السبب.', 'لذلك / جداً', '["هكذا", "إذاً"]', '{"base": "so"}', '/səʊ/', 'so.mp3', '{"synonyms": ["therefore", "very"], "antonyms": [], "word_family": []}', 'Can be used as an adverb of degree or a conjunction.', 'Beginner', 180);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(98, 'I am {so} happy!', 'أنا سعيد جداً!', 'so', 'Emotion', 'Easy', 1, 1),
(98, 'It was raining, {so} I stayed home.', 'كانت تمطر، لذلك بقيت في المنزل.', 'so', 'Reason', 'Easy', 0, 2),
(98, 'Is that {so}?', 'هل هذا صحيح؟', 'so', 'General', 'Easy', 0, 3),
(98, 'I don''t think {so}.', 'لا أظن ذلك.', 'so', 'Opinion', 'Easy', 0, 4),
(98, 'He was {so} tired that he fell asleep.', 'كان متعباً جداً لدرجة أنه نام.', 'so', 'State', 'Easy', 0, 5),
(98, 'And {so} on.', 'وهكذا دواليك.', 'so', 'General', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(98, 'translation_match', 'easy', 'so', 'en', 'لذلك / جداً', 'base', NULL, NULL, NULL, '"so" can mean "very" or "therefore".'),
(98, 'reverse_translation', 'easy', 'لذلك', 'ar', 'so', 'base', NULL, NULL, NULL, 'The Arabic "لذلك" translates to "so" in English.'),
(98, 'sentence_completion', 'easy', 'The cake is ___ good!', 'en', 'so', 'base', 'The cake is ___ good!', 'The cake is so good!', 3, 'Use "so" as an adverb of degree meaning "very".'),
(98, 'sentence_completion', 'easy', 'I was late, ___ I ran.', 'en', 'so', 'base', 'I was late, ___ I ran.', 'I was late, so I ran.', 3, 'Use "so" as a conjunction to show a result.'),
(98, 'sentence_completion', 'easy', 'I hope ___ .', 'en', 'so', 'base', 'I hope ___ .', 'I hope so.', 2, 'Use "so" to refer back to a positive statement.'),
(98, 'sentence_completion', 'easy', 'It is ___ hot today.', 'en', 'so', 'base', 'It is ___ hot today.', 'It is so hot today.', 2, 'Use "so" to emphasize the adjective "hot".'),
(98, 'sentence_completion', 'easy', '___, what happened next?', 'en', 'So', 'base', '___, what happened next?', 'So, what happened next?', 0, 'Use "So" to introduce a question or a new topic.'),
(98, 'sentence_completion', 'easy', 'He is not ___ tall as his brother.', 'en', 'so', 'base', 'He is not ___ tall as his brother.', 'He is not so tall as his brother.', 3, 'Use "so" in negative comparisons.');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(777, 'لكن'), (777, 'أو'), (777, 'إذا'), (777, 'فقط'), (777, 'جداً (فقط)'), (777, 'هنا'), (777, 'هناك'), (777, 'الآن'), (777, 'من'), (777, 'إلى'),
(778, 'but'), (778, 'or'), (778, 'if'), (778, 'very'), (778, 'too'), (778, 'because'), (778, 'and'), (778, 'then'), (778, 'also'), (778, 'yet'),
(779, 'but'), (779, 'or'), (779, 'if'), (779, 'very'), (779, 'too'), (779, 'because'), (779, 'and'), (779, 'then'), (779, 'also'), (779, 'yet'),
(780, 'but'), (780, 'or'), (780, 'if'), (780, 'very'), (780, 'too'), (780, 'because'), (780, 'and'), (780, 'then'), (780, 'also'), (780, 'yet'),
(781, 'but'), (781, 'or'), (781, 'if'), (781, 'very'), (781, 'too'), (781, 'because'), (781, 'and'), (781, 'then'), (781, 'also'), (781, 'yet'),
(782, 'but'), (782, 'or'), (782, 'if'), (782, 'very'), (782, 'too'), (782, 'because'), (782, 'and'), (782, 'then'), (782, 'also'), (782, 'yet'),
(783, 'But'), (783, 'Or'), (783, 'If'), (783, 'Very'), (783, 'Too'), (783, 'Because'), (783, 'And'), (783, 'Then'), (783, 'Also'), (783, 'Yet'),
(784, 'but'), (784, 'or'), (784, 'if'), (784, 'very'), (784, 'too'), (784, 'because'), (784, 'and'), (784, 'then'), (784, 'also'), (784, 'yet');

-- =============================================================================
-- WORD 99: hear (ID: 99, POS: v.)
-- =============================================================================

INSERT INTO word_content (word_id, word, word_ar, pos, definition_en, definition_ar, translation_primary, translation_alternatives, forms, ipa, audio_filename, related_words, usage_notes, difficulty_level, frequency_rank)
VALUES (99, 'hear', 'يسمع', 'v.', 'To perceive with the ear the sound made by someone or something.', 'إدراك الصوت الصادر عن شخص أو شيء بالأذن.', 'يسمع', '["ينصت", "يبلغ"]', '{"base": "hear", "thirdPerson": "hears", "past": "heard", "participle": "heard", "gerund": "hearing"}', '/hɪər/', 'hear.mp3', '{"synonyms": ["listen"], "antonyms": ["ignore"], "word_family": ["hearing"]}', 'Irregular verb: hear, heard, heard.', 'Beginner', 184);

INSERT INTO word_examples (word_id, sentence_en, sentence_ar, form_used, context, difficulty, is_primary, display_order)
VALUES 
(99, 'Can you {hear} me?', 'هل تسمعني؟', 'hear', 'Communication', 'Easy', 1, 1),
(99, 'I {heard} a strange noise.', 'سمعت ضوضاء غريبة.', 'heard', 'General', 'Easy', 0, 2),
(99, 'She {hears} the birds singing.', 'هي تسمع العصافير تغرد.', 'hears', 'Nature', 'Easy', 0, 3),
(99, 'I am {hearing} voices.', 'أنا أسمع أصواتاً.', 'hearing', 'General', 'Easy', 0, 4),
(99, 'Have you {heard} the news?', 'هل سمعت الأخبار؟', 'heard', 'Communication', 'Easy', 0, 5),
(99, 'I can''t {hear} you, speak up.', 'لا أستطيع سماعك، ارفع صوتك.', 'hear', 'Communication', 'Easy', 0, 6);

INSERT INTO questions (word_id, question_type, difficulty, prompt_text, prompt_language, correct_answer, form_expected, sentence_with_blank, full_sentence, missing_word_position, explanation)
VALUES 
(99, 'translation_match', 'easy', 'hear', 'en', 'يسمع', 'base', NULL, NULL, NULL, '"hear" is the base verb for perceiving sound.'),
(99, 'reverse_translation', 'easy', 'يسمع', 'ar', 'hear', 'base', NULL, NULL, NULL, 'The Arabic verb "يسمع" translates to "hear".'),
(99, 'sentence_completion', 'easy', 'I can ___ the music.', 'en', 'hear', 'base', 'I can ___ the music.', 'I can hear the music.', 2, 'Use the base form "hear" after the modal "can".'),
(99, 'sentence_completion', 'easy', 'He ___ a sound in the kitchen.', 'en', 'heard', 'past', 'He ___ a sound in the kitchen.', 'He heard a sound in the kitchen.', 1, 'Use "heard" for the past tense of "hear".'),
(99, 'sentence_completion', 'easy', 'She ___ everything you say.', 'en', 'hears', 'thirdPerson', 'She ___ everything you say.', 'She hears everything you say.', 1, 'Use "hears" for third-person singular present.'),
(99, 'sentence_completion', 'easy', 'I have ___ that story before.', 'en', 'heard', 'participle', 'I have ___ that story before.', 'I have heard that story before.', 2, 'Use "heard" as the past participle after "have".'),
(99, 'sentence_completion', 'easy', 'Are you ___ me now?', 'en', 'hearing', 'gerund', 'Are you ___ me now?', 'Are you hearing me now?', 2, 'Use "hearing" for the present continuous.'),
(99, 'sentence_completion', 'easy', 'Did you ___ that?', 'en', 'hear', 'base', 'Did you ___ that?', 'Did you hear that?', 2, 'Use the base form "hear" after "did".');

INSERT INTO question_distractors (question_id, distractor_text) VALUES 
(785, 'يرى'), (785, 'يتكلم'), (785, 'يمشي'), (785, 'يأكل'), (785, 'ينام'), (785, 'يذهب'), (785, 'يأخذ'), (785, 'يعطي'), (785, 'يقول'), (785, 'يفعل'),
(786, 'see'), (786, 'speak'), (786, 'walk'), (786, 'eat'), (786, 'sleep'), (786, 'go'), (786, 'take'), (786, 'give'), (786, 'say'), (786, 'do'),
(787, 'hears'), (787, 'heard'), (787, 'hearing'), (787, 'sees'), (787, 'saw'), (787, 'seen'), (787, 'seeing'), (787, 'speaks'), (787, 'spoke'), (787, 'spoken'),
(788, 'hear'), (788, 'hears'), (788, 'hearing'), (788, 'see'), (788, 'sees'), (788, 'saw'), (788, 'seen'), (788, 'seeing'), (788, 'speak'), (788, 'speaks'),
(789, 'hear'), (789, 'heard'), (789, 'hearing'), (789, 'see'), (789, 'sees'), (789, 'saw'), (789, 'seen'), (789, 'seeing'), (789, 'speak'), (789, 'speaks'),
(790, 'hear'), (790, 'hears'), (790, 'hearing'), (790, 'see'), (790, 'sees'), (790, 'saw'), (790, 'seen'), (790, 'seeing'), (790, 'speak'), (790, 'speaks'),
(791, 'hear'), (791, 'hears'), (791, 'heard'), (791, 'see'), (791, 'sees'), (791, 'saw'), (791, 'seen'), (791, 'seeing'), (791, 'speak'), (791, 'speaks'),
(792, 'hears'), (792, 'heard'), (792, 'hearing'), (792, 'sees'), (792, 'saw'), (792, 'seen'), (792, 'seeing'), (792, 'speaks'), (792, 'spoke'), (792, 'spoken');