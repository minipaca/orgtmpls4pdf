;; Copyright (c)  2019, 2023 Xu Xin <sxuxin@protonmail.com>

(define i-lang
  (lambda ()
    (let ((lang-list
	   '("bg_BG" "ca_AD" "ca_ES" "ca_ES"
	     "ca_FR" "ca_IT" "cs_CZ" "da_DK"
	     "de_AT" "de_BE" "de_CH" "de_DE"
	     "de_IT" "de_LI" "de_LU" "en_AG"
	     "en_AU" "en_BW" "en_CA" "en_DK"
	     "en_GB" "en_HK" "en_IE" "en_IL"
	     "en_IN" "en_NG" "en_NZ" "en_PH"
	     "en_SG" "en_US" "en_ZA" "en_ZM"
	     "en_ZW" "es_AR" "es_BO" "es_CL"
	     "es_CO" "es_CR" "es_CU" "es_DO"
	     "es_EC" "es_ES" "es_GT" "es_HN"
	     "es_MX" "es_NI" "es_PA" "es_PE"
	     "es_PR" "es_PY" "es_SV" "es_US"
	     "es_UY" "es_VE" "fr_BE" "fr_CA"
	     "fr_CH" "fr_FR" "fr_LU" "hu_HU"
	     "id_ID" "it_CH" "it_IT" "ja_JP"
	     "ko_KR" "nb_NO" "nl_AW" "nl_BE"
	     "nl_NL" "pl_PL" "pt_BR" "pt_PT"
	     "ru_RU" "ru_UA" "sv_FI" "sv_SE"
	     "th_TH" "tr_CY" "tr_TR" "uk_UA"
	     "vi_VN" "zh_CN" "zh_HK" "zh_SG"
	     "zh_TW"))
      	  (lang (substring (getenv "LANG") 0 5)))
      (if (equal? (member lang lang-list) #f)
      	  "en_US"
	  lang))))
