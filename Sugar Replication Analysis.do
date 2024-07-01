/*Replication Code - How Sweet is the Deal?

*/

**# Read
use "Sugar Replication Data", clear

// Macros
global service OnlineSex MakeOut Pictures PublicR PrivateR Date Talk
global controls birthsex age white black asian hispanic i.status i.sexor i.religion i.relstat i.ses i.work


**# Descriptives
sum i.*Compensation, sep(0)
sum *_Choice $controls, sep(0)


**# Student Charactersitics
reg HaveSex_Choice i.HaveSex_Compensation birthsex age white black asian hispanic i.status i.sexor i.religion i.relstat i.ses i.work, robust
reg OnlineSex_Choice i.OnlineSex_Compensation birthsex age white black asian hispanic i.status i.sexor i.religion i.relstat i.ses i.work, robust
reg MakeOut_Choice i.MakeOut_Compensation birthsex age white black asian hispanic i.status i.sexor i.religion i.relstat i.ses i.work, robust
reg Pictures_Choice i.Pictures_Compensation birthsex age white black asian hispanic i.status i.sexor i.religion i.relstat i.ses i.work, robust
reg PublicR_Choice i.PublicR_Compensation birthsex age white black asian hispanic i.status i.sexor i.religion i.relstat i.ses i.work, robust
reg PrivateR_Choice i.PrivateR_Compensation birthsex age white black asian hispanic i.status i.sexor i.religion i.relstat i.ses i.work, robust
reg Date_Choice i.Date_Compensation birthsex age white black asian hispanic i.status i.sexor i.religion i.relstat i.ses i.work, robust
reg Talk_Choice i.Talk_Compensation birthsex age white black asian hispanic i.status i.sexor i.religion i.relstat i.ses i.work, robust

**## Outreg
reg HaveSex_Choice i.HaveSex_Compensation $controls, robust
outreg2 using "Results/Model1.xls", replace ctitle(Have Sex) label excel alpha(0.01, 0.05, 0.1)

foreach var of global service {
	reg `var'_Choice i.`var'_Compensation $controls, robust
	outreg2 using "Results/Model1.xls", append ctitle(`var') label excel alpha(0.01, 0.05, 0.1)
}


**# Experimental Models
reg HaveSex_Choice i.HaveSex_Compensation, robust

reg HaveSex_Choice ib2.HaveSex_Compensation, robust // Change the refernece to lowest category
reg OnlineSex_Choice ib2.OnlineSex_Compensation, robust // Change the refernece to lowest category
reg MakeOut_Choice ib2.MakeOut_Compensation, robust // Change the refernece to lowest category
reg Pictures_Choice ib2.Pictures_Compensation, robust // Change the refernece to lowest category
reg PublicR_Choice ib2.PublicR_Compensation, robust // Change the refernece to lowest category
reg PrivateR_Choice ib2.PrivateR_Compensation, robust // Change the refernece to lowest category
reg Date_Choice ib2.Date_Compensation, robust // Change the refernece to lowest category
reg Talk_Choice ib2.Talk_Compensation, robust // Change the refernece to lowest category

margins, at(HaveSex_Compensation = (1(1)9))

**## Outreg
reg HaveSex_Choice ib2.HaveSex_Compensation, robust
outreg2 using "Results/Model2.xls", replace ctitle(Have Sex) label excel alpha(0.01, 0.05, 0.1)

foreach var of global service {
	reg `var'_Choice ib2.`var'_Compensation, robust
	outreg2 using "Results/Model2.xls", append ctitle(`var') label excel alpha(0.01, 0.05, 0.1)
}

**## Margins
quietly: reg HaveSex_Choice i.HaveSex_Compensation, robust
margins, at(HaveSex_Compensation = (1(1)9))

quietly: reg OnlineSex_Choice i.OnlineSex_Compensation, robust
margins, at(OnlineSex_Compensation = (1(1)9))

quietly: reg MakeOut_Choice i.MakeOut_Compensation, robust
margins, at(MakeOut_Compensation = (1(1)9))

quietly: reg Pictures_Choice i.Pictures_Compensation, robust
margins, at(Pictures_Compensation = (1(1)9))

quietly: reg PublicR_Choice i.PublicR_Compensation, robust
margins, at(PublicR_Compensation = (1(1)9))

quietly: reg PrivateR_Choice i.PrivateR_Compensation, robust
margins, at(PrivateR_Compensation = (1(1)9))

quietly: reg Date_Choice i.Date_Compensation, robust
margins, at(Date_Compensation = (1(1)9))

quietly: reg Talk_Choice i.Talk_Compensation, robust
margins, at(Talk_Compensation = (1(1)9))


**# Moderation by Sex
reg HaveSex_Choice ib2.HaveSex_Compensation##i.birthsex, robust
reg OnlineSex_Choice ib2.OnlineSex_Compensation##i.birthsex, robust
reg MakeOut_Choice ib2.MakeOut_Compensation##i.birthsex, robust
reg Pictures_Choice ib2.Pictures_Compensation##i.birthsex, robust
reg PublicR_Choice ib2.PublicR_Compensation##i.birthsex, robust
reg PrivateR_Choice ib2.PrivateR_Compensation##i.birthsex, robust
reg Date_Choice ib2.Date_Compensation##i.birthsex, robust
reg Talk_Choice ib2.Talk_Compensation##i.birthsex, robust

**## Outreg
reg HaveSex_Choice ib2.HaveSex_Compensation##i.birthsex, robust
outreg2 using "Results/Model3.xls", replace ctitle(Have Sex) label excel alpha(0.01, 0.05, 0.1)

foreach var of global service {
	reg `var'_Choice ib2.`var'_Compensation##i.birthsex, robust
	outreg2 using "Results/Model3.xls", append ctitle(`var') label excel alpha(0.01, 0.05, 0.1)
}

**## Margins
// Margins Numeric
reg HaveSex_Choice ib2.HaveSex_Compensation##i.birthsex, robust
margins, at(HaveSex_Compensation = (1(1)9) birthsex = (0))
margins, at(HaveSex_Compensation = (1(1)9) birthsex = (1))

reg OnlineSex_Choice ib2.OnlineSex_Compensation##i.birthsex, robust
margins, at(OnlineSex_Compensation = (1(1)9) birthsex = (0))
margins, at(OnlineSex_Compensation = (1(1)9) birthsex = (1))

reg MakeOut_Choice ib2.MakeOut_Compensation##i.birthsex, robust
margins, at(MakeOut_Compensation = (1(1)9) birthsex = (0))
margins, at(MakeOut_Compensation = (1(1)9) birthsex = (1))

reg Pictures_Choice ib2.Pictures_Compensation##i.birthsex, robust
margins, at(Pictures_Compensation = (1(1)9) birthsex = (0))
margins, at(Pictures_Compensation = (1(1)9) birthsex = (1))

reg PublicR_Choice ib2.PublicR_Compensation##i.birthsex, robust
margins, at(PublicR_Compensation = (1(1)9) birthsex = (0))
margins, at(PublicR_Compensation = (1(1)9) birthsex = (1))

reg PrivateR_Choice ib2.PrivateR_Compensation##i.birthsex, robust
margins, at(PrivateR_Compensation = (1(1)9) birthsex = (0))
margins, at(PrivateR_Compensation = (1(1)9) birthsex = (1))

reg Date_Choice ib2.Date_Compensation##i.birthsex, robust
margins, at(Date_Compensation = (1(1)9) birthsex = (0))
margins, at(Date_Compensation = (1(1)9) birthsex = (1))

reg Talk_Choice ib2.Talk_Compensation##i.birthsex, robust
margins, at(Talk_Compensation = (1(1)9) birthsex = (0))
margins, at(Talk_Compensation = (1(1)9) birthsex = (1))

foreach var of global service {
	quietly: reg `var'_Choice i.`var'_Compensation##i.birthsex, robust
	margins, at(`var'_Compensation = (1(1)9) birthsex = (0))
	margins, at(`var'_Compensation = (1(1)9) birthsex = (1))
}

// Margins Plot
quietly: reg HaveSex_Choice i.HaveSex_Compensation##i.birthsex, robust
margins, at(HaveSex_Compensation = (1(1)9) birthsex = (0 1))
marginsplot, ylabel(-.1(.1)1.1) ytitle("Predicted Value") xtitle("") title("") xlabel(1 "Company" 2 "Friendship" 3 "Travel" 4 "Gifts" 5 "Tuition" 6 "$100" 7 "$1k" 8 "$10k" 9 "$100k") legend(pos(top) row(1) ring(1)) scale(1.2) subtitle("{it:(A) Have Sex}", size(11pt) position(11) ring(1)) yline(.5, lpattern(dash) lcolor(gray)) yline(0, lpattern(solid) lcolor(gray)) yline(1, lpattern(solid) lcolor(gray))

quietly: reg OnlineSex_Choice i.OnlineSex_Compensation##i.birthsex
margins, at(OnlineSex_Compensation = (1(1)9) birthsex = (0 1))
marginsplot, ylabel(-.1(.1)1.1) ytitle("Predicted Value") xtitle("") title("") xlabel(1 "Company" 2 "Friendship" 3 "Travel" 4 "Gifts" 5 "Tuition" 6 "$100" 7 "$1k" 8 "$10k" 9 "$100k") legend(pos(top) row(1) ring(1)) scale(1.2) subtitle("{it:(B) Online Sex}", size(11pt) position(11) ring(1)) yline(.5, lpattern(dash) lcolor(gray)) yline(0, lpattern(solid) lcolor(gray)) yline(1, lpattern(solid) lcolor(gray))

quietly: reg MakeOut_Choice i.MakeOut_Compensation##i.birthsex, robust
margins, at(MakeOut_Compensation = (1(1)9) birthsex = (0 1))
marginsplot, ylabel(-.1(.1)1.1) ytitle("Predicted Value") xtitle("") title("") xlabel(1 "Company" 2 "Friendship" 3 "Travel" 4 "Gifts" 5 "Tuition" 6 "$100" 7 "$1k" 8 "$10k" 9 "$100k") legend(pos(top) row(1) ring(1)) scale(1.2) subtitle("{it:(C) Make Out}", size(11pt) position(11) ring(1)) yline(.5, lpattern(dash) lcolor(gray)) yline(0, lpattern(solid) lcolor(gray)) yline(1, lpattern(solid) lcolor(gray))

quietly: reg Pictures_Choice i.Pictures_Compensation##i.birthsex, robust
margins, at(Pictures_Compensation = (1(1)9) birthsex = (0 1))
marginsplot, ylabel(-.1(.1)1.1) ytitle("Predicted Value") xtitle("") title("") xlabel(1 "Company" 2 "Friendship" 3 "Travel" 4 "Gifts" 5 "Tuition" 6 "$100" 7 "$1k" 8 "$10k" 9 "$100k") legend(pos(top) row(1) ring(1)) scale(1.2) subtitle("{it:(D) Intimate Pictures}", size(11pt) position(11) ring(1)) yline(.5, lpattern(dash) lcolor(gray)) yline(0, lpattern(solid) lcolor(gray)) yline(1, lpattern(solid) lcolor(gray))

quietly: reg PublicR_Choice i.PublicR_Compensation##i.birthsex, robust
margins, at(PublicR_Compensation = (1(1)9) birthsex = (0 1))
marginsplot, ylabel(-.1(.1)1.1) ytitle("Predicted Value") xtitle("") title("") xlabel(1 "Company" 2 "Friendship" 3 "Travel" 4 "Gifts" 5 "Tuition" 6 "$100" 7 "$1k" 8 "$10k" 9 "$100k") legend(pos(top) row(1) ring(1)) scale(1.2) subtitle("{it:(A) Public Relationship}", size(11pt) position(11) ring(1)) yline(.5, lpattern(dash) lcolor(gray)) yline(0, lpattern(solid) lcolor(gray)) yline(1, lpattern(solid) lcolor(gray))

quietly: reg PrivateR_Choice i.PrivateR_Compensation##i.birthsex, robust
margins, at(PrivateR_Compensation = (1(1)9) birthsex = (0 1))
marginsplot, ylabel(-.1(.1)1.1) ytitle("") xtitle("") title("") xlabel(1 "Company" 2 "Friendship" 3 "Travel" 4 "Gifts" 5 "Tuition" 6 "$100" 7 "$1k" 8 "$10k" 9 "$100k") legend(pos(top) row(1) ring(1)) scale(1.2) subtitle("{it:(B) Private Relationship}", size(11pt) position(11) ring(1)) yline(.5, lpattern(dash) lcolor(gray)) yline(0, lpattern(solid) lcolor(gray)) yline(1, lpattern(solid) lcolor(gray))

quietly: reg Date_Choice i.Date_Compensation##i.birthsex, robust
margins, at(Date_Compensation = (1(1)9) birthsex = (0 1))
marginsplot, ylabel(-.1(.1)1.1) ytitle("Predicted Value") xtitle("") title("") xlabel(1 "Company" 2 "Friendship" 3 "Travel" 4 "Gifts" 5 "Tuition" 6 "$100" 7 "$1k" 8 "$10k" 9 "$100k") legend(pos(top) row(1) ring(1)) scale(1.2) subtitle("{it:(C) Date}", size(11pt) position(11) ring(1)) yline(.5, lpattern(dash) lcolor(gray)) yline(0, lpattern(solid) lcolor(gray)) yline(1, lpattern(solid) lcolor(gray))

quietly: reg Talk_Choice i.Talk_Compensation##i.birthsex, robust
margins, at(Talk_Compensation = (1(1)9) birthsex = (0 1))
marginsplot, ylabel(-.1(.1)1.1) ytitle("Predicted Value") xtitle("") title("") xlabel(1 "Company" 2 "Friendship" 3 "Travel" 4 "Gifts" 5 "Tuition" 6 "$100" 7 "$1k" 8 "$10k" 9 "$100k") legend(pos(top) row(1) ring(1)) scale(1.2) subtitle("{it:(D) Talk}", size(11pt) position(11) ring(1)) yline(.5, lpattern(dash) lcolor(gray)) yline(0, lpattern(solid) lcolor(gray)) yline(1, lpattern(solid) lcolor(gray))

