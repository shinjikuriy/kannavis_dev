SELECT id,
       word_level_for_international_students AS level,
       word_ranking_for_international_students AS ranking,
       old_jlpt_level AS former_jlpt_level,
       lexeme,
       standard_newspaper_orthography AS defacto_orthography,
       standard_reading
FROM tatsum_vdrj
ORDER BY id
;