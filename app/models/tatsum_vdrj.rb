# == Schema Information
#
# Table name: tatsum_vdrj
#
#  id                                                           :bigint           not null, primary key
#  word_level_for_international_students                        :integer          not null
#  word_ranking_for_international_students                      :integer          not null
#  word_level_for_general_learners                              :integer          not null
#  word_ranking_for_general_learners                            :integer          not null
#  word_level_for_written_japanese                              :integer
#  u_ranking_for_written_japanese_excluding_assumed_known_words :integer
#  old_jlpt_level                                               :integer          not null
#  specificity_level_in_humanities_and_arts_ha                  :integer
#  specificity_level_in_social_sciences_ss                      :integer
#  specificity_level_in_technological_natural_sciences_ss       :integer
#  specificity_level_in_bio_medical_natural_sciences_bn         :integer
#  possible_literary_keywords                                   :boolean          not null
#  word_tier_label                                              :string
#  lexeme                                                       :string           not null
#  standard_newspaper_orthography                               :string           not null
#  standard_reading                                             :string
#  part_of_speech                                               :string           not null
#  word_origin_type                                             :string           not null
#  magazine_forms                                               :string
#  standardized_total_freq_per_million_in_10_written_domains_fw :float            not null
#  d                                                            :float            not null
#  range                                                        :integer          not null
#  lw_freq_per_million                                          :float            not null
#  lp_freq_per_million                                          :float            not null
#  he_freq_per_million                                          :float            not null
#  ah_freq_per_million                                          :float            not null
#  pl_freq_per_million                                          :float            not null
#  ec_freq_per_million                                          :float            not null
#  se_freq_per_million                                          :float            not null
#  st_freq_per_million                                          :float            not null
#  bm_freq_per_million                                          :float            not null
#  oc_freq_per_million                                          :float            not null
#
class TatsumVdrj < ProgramDataRecord
  self.table_name = 'tatsum_vdrj'
end
