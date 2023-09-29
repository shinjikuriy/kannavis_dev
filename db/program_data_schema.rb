# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_29_045615) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "joyokanji", force: :cascade do |t|
    t.string "grapheme_orth", limit: 1, null: false
    t.string "grapheme_alt", limit: 1
    t.string "grapheme_olds", array: true
    t.string "radicals", array: true
    t.integer "stroke_count"
    t.string "grade"
    t.integer "added_year"
    t.integer "removed_year"
    t.string "onyomis", array: true
    t.string "kunyomis", array: true
    t.index ["grapheme_orth", "grapheme_alt", "grapheme_olds"], name: "joyokanji_index", unique: true
  end

  create_table "kanjis_vocabs", id: false, force: :cascade do |t|
    t.bigint "kanji_id", null: false
    t.bigint "vocab_id", null: false
    t.index ["kanji_id", "vocab_id"], name: "index_kanjis_vocabs_on_kanji_id_and_vocab_id", unique: true
    t.index ["vocab_id", "kanji_id"], name: "index_kanjis_vocabs_on_vocab_id_and_kanji_id"
  end

  create_table "mifune_kanjidict", force: :cascade do |t|
    t.string "grapheme", limit: 1, null: false
    t.string "radical", limit: 1
    t.string "radical_variant", limit: 1
    t.string "phonetic_component", limit: 1
    t.string "idc"
    t.string "classification"
    t.string "joyo_onyomis", array: true
    t.string "joyo_kunyomis", array: true
    t.string "onyomis", array: true
    t.string "kunyomis", array: true
    t.string "nanoris", array: true
    t.integer "stroke_count", null: false
    t.string "grade"
    t.string "jlpt"
    t.string "kanken"
    t.integer "frequency"
    t.string "meanings", array: true
    t.string "compact_meanings", array: true
    t.integer "rtk1_3_old"
    t.integer "rtk1_3_new"
    t.integer "ko2001"
    t.integer "ko2301"
    t.integer "wrp_jkf"
    t.integer "wanikani"
    t.index ["grapheme"], name: "index_mifune_kanjidict_on_grapheme", unique: true
  end

  create_table "tatsum_cdj", force: :cascade do |t|
    t.integer "level_for_kanji_and_signs_for_international_students", null: false
    t.integer "ranking_for_kanji_and_signs_for_international_students", null: false
    t.integer "level_for_kanji_and_signs_for_general_learners", null: false
    t.integer "ranking_for_kanji_and_signs_for_general_learners", null: false
    t.integer "level_for_kanji_and_signs_in_written_japanese", null: false
    t.integer "u_ranking_for_kanji_and_signs_in_written_japanese", null: false
    t.integer "overall_freq_ranking", null: false
    t.integer "fw_ranking_for_kanji_and_signs", null: false
    t.string "the_former_jlpt_kanji_level"
    t.integer "specificity_level_in_humanities_and_arts_ha"
    t.integer "specificity_level_in_social_sciences_ss"
    t.integer "specificity_level_in_technological_natural_sciences_tn"
    t.integer "specificity_level_in_bio_medical_natural_sciences_bn"
    t.string "academic_kanji_and_limited_academic_domain_kanji"
    t.string "possible_literary_key_character"
    t.string "type_of_character", null: false
    t.string "item", null: false
    t.integer "frequency", null: false
    t.float "standardized_freq_per_million_in_10_written_domains_fw", null: false
    t.string "fw_cumulative_text_coverage", null: false
    t.float "d", null: false
    t.integer "d_ranking", null: false
    t.float "uw_usage_coefficient_for_written_japanese", null: false
    t.integer "range", null: false
    t.float "lw_freq_per_million", null: false
    t.integer "lw_freq_ranking", null: false
    t.float "lp_freq_per_million", null: false
    t.integer "lp_freq_ranking", null: false
    t.float "he_freq_per_million", null: false
    t.integer "he_freq_ranking", null: false
    t.float "ah_freq_per_million", null: false
    t.integer "ah_freq_ranking", null: false
    t.float "pl_freq_per_million", null: false
    t.integer "pl_freq_ranking", null: false
    t.float "ec_freq_per_million", null: false
    t.integer "ec_freq_ranking", null: false
    t.float "se_freq_per_million", null: false
    t.integer "se_freq_ranking", null: false
    t.float "st_freq_per_million", null: false
    t.integer "st_freq_ranking", null: false
    t.float "bm_freq_per_million", null: false
    t.integer "bm_freq_ranking", null: false
    t.float "if_freq_per_million", null: false
    t.integer "if_freq_ranking", null: false
    t.integer "id_for_home_position", null: false
    t.string "ranking_by_freq_in_category", null: false
    t.index ["item"], name: "index_tatsum_cdj_on_item", unique: true
  end

  create_table "tatsum_vdrj", force: :cascade do |t|
    t.integer "word_level_for_international_students", null: false
    t.integer "word_ranking_for_international_students", null: false
    t.integer "word_level_for_general_learners", null: false
    t.integer "word_ranking_for_general_learners", null: false
    t.integer "word_level_for_written_japanese"
    t.integer "u_ranking_for_written_japanese_excluding_assumed_known_words"
    t.integer "old_jlpt_level", null: false
    t.integer "specificity_level_in_humanities_and_arts_ha"
    t.integer "specificity_level_in_social_sciences_ss"
    t.integer "specificity_level_in_technological_natural_sciences_ss"
    t.integer "specificity_level_in_bio_medical_natural_sciences_bn"
    t.boolean "possible_literary_keywords", null: false
    t.string "word_tier_label"
    t.string "lexeme", null: false
    t.string "standard_newspaper_orthography", null: false
    t.string "standard_reading"
    t.string "part_of_speech", null: false
    t.string "word_origin_type", null: false
    t.string "magazine_forms"
    t.float "standardized_total_freq_per_million_in_10_written_domains_fw", null: false
    t.float "d", null: false
    t.integer "range", null: false
    t.float "lw_freq_per_million", null: false
    t.float "lp_freq_per_million", null: false
    t.float "he_freq_per_million", null: false
    t.float "ah_freq_per_million", null: false
    t.float "pl_freq_per_million", null: false
    t.float "ec_freq_per_million", null: false
    t.float "se_freq_per_million", null: false
    t.float "st_freq_per_million", null: false
    t.float "bm_freq_per_million", null: false
    t.float "oc_freq_per_million", null: false
    t.index ["lexeme"], name: "index_vocabs_on_lexeme", unique: true
    t.index ["standard_newspaper_orthography"], name: "index_vocabs_on_standard_newspaper_orthography"
  end


  create_view "kanjis", materialized: true, sql_definition: <<-SQL
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
     FROM ((tatsum_cdj t
       JOIN mifune_kanjidict m ON (((t.item)::text = (m.grapheme)::text)))
       LEFT JOIN joyokanji j ON (((t.item)::text = (j.grapheme_orth)::text)))
    ORDER BY t.id;
  SQL
  create_view "vocabs", materialized: true, sql_definition: <<-SQL
      SELECT tatsum_vdrj.id,
      tatsum_vdrj.standard_newspaper_orthography AS defacto_orthography,
      tatsum_vdrj.lexeme,
      tatsum_vdrj.standard_reading,
      tatsum_vdrj.part_of_speech,
      tatsum_vdrj.word_origin_type,
      tatsum_vdrj.old_jlpt_level AS former_jlpt_level,
      tatsum_vdrj.word_level_for_international_students AS level,
      tatsum_vdrj.word_ranking_for_international_students AS ranking
     FROM tatsum_vdrj
    ORDER BY tatsum_vdrj.id;
  SQL
end
