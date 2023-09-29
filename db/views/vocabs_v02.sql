SELECT id,
		standard_newspaper_orthography AS defacto_orthography,
		lexeme,
		standard_reading,
		part_of_speech,
		word_origin_type,
		old_jlpt_level AS former_jlpt_level,
		word_level_for_international_students AS level,
		word_ranking_for_international_students AS ranking
FROM tatsum_vdrj
ORDER BY id
;