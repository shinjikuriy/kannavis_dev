SELECT t.id,
       t.item AS grapheme,
       j.grapheme_alt,
       j.grapheme_olds,
       m.onyomis,
       m.kunyomis,
       m.joyo_onyomis,
       m.joyo_kunyomis,
       m.compact_meanings,
       m.meanings,
       m.radical,
       m.radical_variant,
       m.phonetic_component,
       m.stroke_count,
       m.jlpt AS estimated_jlpt_level,
       t.the_former_jlpt_kanji_level AS former_jlpt_level,
       t.level_for_kanji_and_signs_for_international_students AS level,
       t.ranking_for_kanji_and_signs_for_international_students AS ranking
FROM tatsum_cdj AS t
JOIN mifune_kanjidict AS m
ON t.item = m.grapheme
LEFT JOIN joyokanji AS j
ON t.item = j.grapheme_orth
ORDER BY t.id;