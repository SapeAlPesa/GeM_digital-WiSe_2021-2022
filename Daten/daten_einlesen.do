* Einlesen von Excel-Dateien
*Jobs von privaten Anbieter:innen
import excel using "K:\GeM_digital\WiSe_2021-2022\Daten\stellenwerk_private_jobs_10122021.xlsx", firstrow clear
missings dropobs, force
tostring app_link, gen(sapp_link)
drop app_link
rename sapp_link app_link
generate b2b = 0
save "K:\GeM_digital\WiSe_2021-2022\Daten\stellenwerk_private_jobs_10122021.dta", replace

* Jobs für Studierende von Unternehmen
import excel using "K:\GeM_digital\WiSe_2021-2022\Daten\stellenwerk_studentenjobs_17112021.xlsx", firstrow clear
missings dropobs, force
order link, last
tostring link, gen(slink)
drop link
rename slink link
generate b2b = 1
save "K:\GeM_digital\WiSe_2021-2022\Daten\stellenwerk_studentenjobs_17112021.dta", replace

append using "K:\GeM_digital\WiSe_2021-2022\Daten\stellenwerk_private_jobs_10122021.dta"

save "K:\GeM_digital\WiSe_2021-2022\Daten\stellenwerk_alle_jobs.dta", replace


* ungekürzte Ausgabe langer Strings
list job_profile in 135, notrim
display _asis job_profile[135]

* D
generate duz_wort_jd = regexs(0) if(regexm(job_descrip, "(D|d)u |(D|d)ir |(D|d)ein(em|en|er|es|e)? "))
generate duz_wort_jp = regexs(0) if(regexm(job_profile, "(D|d)u |(D|d)ir |(D|d)ein(em|en|er|es|e)? "))
generate duzen = 0
replace duzen = 1 if !missing(duz_wort_jd) | !missing(duz_wort_jp)

tabulate duzen

tabulate duzen b2b, column nofreq

*generate duzen = 0
*replace duzen = 1 if(regexm(job_profile, "(D|d)u|(D|d)ir|(D|d)ein(em|en|er|es|e)?"))



