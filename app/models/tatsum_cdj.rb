# == Schema Information
#
# Table name: tatsum_cdj
#
#  id                                                     :bigint           not null, primary key
#  level_for_kanji_and_signs_for_international_students   :integer          not null
#  ranking_for_kanji_and_signs_for_international_students :integer          not null
#  level_for_kanji_and_signs_for_general_learners         :integer          not null
#  ranking_for_kanji_and_signs_for_general_learners       :integer          not null
#  level_for_kanji_and_signs_in_written_japanese          :integer          not null
#  u_ranking_for_kanji_and_signs_in_written_japanese      :integer          not null
#  overall_freq_ranking                                   :integer          not null
#  fw_ranking_for_kanji_and_signs                         :integer          not null
#  the_former_jlpt_kanji_level                            :string
#  specificity_level_in_humanities_and_arts_ha            :integer
#  specificity_level_in_social_sciences_ss                :integer
#  specificity_level_in_technological_natural_sciences_tn :integer
#  specificity_level_in_bio_medical_natural_sciences_bn   :integer
#  academic_kanji_and_limited_academic_domain_kanji       :string
#  possible_literary_key_character                        :string
#  type_of_character                                      :string           not null
#  item                                                   :string           not null
#  frequency                                              :integer          not null
#  standardized_freq_per_million_in_10_written_domains_fw :float            not null
#  fw_cumulative_text_coverage                            :string           not null
#  d                                                      :float            not null
#  d_ranking                                              :integer          not null
#  uw_usage_coefficient_for_written_japanese              :float            not null
#  range                                                  :integer          not null
#  lw_freq_per_million                                    :float            not null
#  lw_freq_ranking                                        :integer          not null
#  lp_freq_per_million                                    :float            not null
#  lp_freq_ranking                                        :integer          not null
#  he_freq_per_million                                    :float            not null
#  he_freq_ranking                                        :integer          not null
#  ah_freq_per_million                                    :float            not null
#  ah_freq_ranking                                        :integer          not null
#  pl_freq_per_million                                    :float            not null
#  pl_freq_ranking                                        :integer          not null
#  ec_freq_per_million                                    :float            not null
#  ec_freq_ranking                                        :integer          not null
#  se_freq_per_million                                    :float            not null
#  se_freq_ranking                                        :integer          not null
#  st_freq_per_million                                    :float            not null
#  st_freq_ranking                                        :integer          not null
#  bm_freq_per_million                                    :float            not null
#  bm_freq_ranking                                        :integer          not null
#  if_freq_per_million                                    :float            not null
#  if_freq_ranking                                        :integer          not null
#  id_for_home_position                                   :integer          not null
#  ranking_by_freq_in_category                            :string           not null
#
class TatsumCdj < ProgramDataRecord
  self.table_name = 'tatsum_cdj'
end
