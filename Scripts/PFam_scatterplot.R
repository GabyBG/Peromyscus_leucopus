setwd("/Users/gbald/Desktop/R/Peromyscus/Pfam")

Pero <- read.delim("Peromyscus_target_Pfam.txt", sep = " ", header=FALSE)
Mouse <- read.delim("Mouse_target_Pfam.txt", sep = " ", header=FALSE)
names(Mouse)[1]="Domain"
names(Pero)[1]="Domain"

sum(Pero$V2)

View(Pero)

View(Pero)


boo <- merge(Pero, Mouse, by="Domain", all=TRUE)
View(boo)

boo[is.na(boo)] <- 0
View(boo)


boo$V2.x <- (boo$V2.x+ 1)
boo$V2.y <- (boo$V2.y+ 1)
boo$V3 <- (boo$V2.x/boo$V2.y)

View(boo)

library(plotly)
library(ggplot2)
z <- ggplot(boo, aes(x=log2(V2.x), y=log2(V2.y))) + geom_point(color=boo$colors)

y <- qplot(log2(V2.x),log2(V2.y),data=boo,geom=c("point"),color=Domain,main="ggplot")
ggplotly(y)

z2 <- z + labs(x = "Peromyscus PFam domain prevalence", y="Mouse PFam domain prevalence", title = "PFam analysis") + theme_bw()

z3 <- z2 + theme(axis.title.x = element_text(size=14),axis.title.y = element_text(size=14)) 

z3 + theme(axis.text.x = element_text(size=14),axis.text.y = element_text(size=14)) 

z

row.names(boo) <- boo$Domain
boo$V3 <- ""
ix_label <- c(4623,4029,4696,3954,4026,4030,5259,5376,2460,2461,4897,4435,865,4285,4425,2976)


boo$V3[ix_label] <- rownames(boo)[ix_label]

library(ggrepel)
ggplot(boo, aes(log2(V2.x),log2(V2.y), label = V3)) +
  geom_point(color = boo$colors,size = ifelse(boo$V3 == "", 2, 4))+
  geom_text_repel(size=4) + theme_bw() + theme(axis.text=element_text(size=12),
                                               axis.title=element_text(size=14,face="bold")) +
  labs(x= "log2(Counts for Peromyscus)", y="log2(Counts for Mouse)",title = "Pfam analysis") +
  xlim(0, 10) + ylim(0, 10)


#no labels
ggplot(boo, aes(log2(V2.x),log2(V2.y))) +
  geom_point(color = boo$colors,size = ifelse(boo$V3 == "", 2, 4))+
  theme_bw() + theme(axis.text=element_text(size=12),
                                               axis.title=element_text(size=14,face="bold")) +
  labs(x= "log2(Counts for Peromyscus)", y="log2(Counts for Mouse)",title = "Pfam analysis") +
  xlim(0, 10) + ylim(0, 10)


View(boo)

PeroUnique <-subset(boo, V2.y==0)
PeroUnique <-subset(PeroUnique,V2.x!=0)

MouseUnique <-subset(boo, V2.x==0)
MouseUnique <-subset(MouseUnique,V2.y!=0)
View(PeroUnique)


View(boo)
boo$colors=""
boo$colors[boo$V3==""]="#253494"
#retrotranscription/retrovirus
boo$colors[(boo$V3!="") & (boo$Domain == "RVT_1") ] ="#af8dc3"
boo$colors[(boo$V3!="") & (boo$Domain == "RVT_thumb" ) ] ="#af8dc3"
boo$colors[(boo$V3!="") & (boo$Domain == "rve" ) ] ="#af8dc3"
boo$colors[(boo$V3!="") & (boo$Domain == "RNase_H" ) ] ="#af8dc3"

#L1 transposable element like
boo$colors[(boo$V3!="") & (boo$Domain == "Tnp_22_dsRBD" ) ] ="#f03b20"
boo$colors[(boo$V3!="") & (boo$Domain == "Transposase_22" ) ] ="#f03b20"
boo$colors[(boo$V3!="") & (boo$Domain == "Tnp_22_trimer" ) ] ="#f03b20"
#G protein-coupled receptors
boo$colors[(boo$V3!="") & (boo$Domain == "V1R" ) ] ="#ffd92f"
boo$colors[(boo$V3!="") & (boo$Domain == "TAS2R" ) ] ="#ffd92f"
boo$colors[(boo$V3!="") & (boo$Domain == "NCD3G" ) ] ="#ffd92f"

#antibacterial
boo$colors[(boo$V3!="") & (boo$Domain == "Defensin_beta" ) ] ="#66a61e"

#High sulfur proteins 
boo$colors[(boo$V3!="") & (boo$Domain == "Keratin_B2" ) ] ="#dd1c77"
boo$colors[(boo$V3!="") & (boo$Domain == "Keratin_B2_2" ) ] ="#dd1c77"

#other families
boo$colors[(boo$V3!="") & (boo$Domain == "Cor1" ) ] ="#253494"
boo$colors[(boo$V3!="") & (boo$Domain == "Gp_dh_C" ) ] ="#253494"
boo$colors[(boo$V3!="") & (boo$Domain == "zf-CCHC_5" ) ] ="#253494"
boo$colors[(boo$V3!="") & (boo$Domain == "Cadherin_tail" ) ] ="#253494"
boo$colors[(boo$V3!="") & (boo$Domain == "LCE" ) ] ="#253494"
boo$colors[(boo$V3!="") & (boo$Domain == "Spin-Ssty" ) ] ="#253494"
boo$colors[(boo$V3!="") & (boo$Domain == "Takusan" ) ] ="#253494"


#real genes list
row.names(boo) <- boo$Domain
boo$V3 <- ""
ix_label <- c(2873,5376,195,1935,2486,6320,198,3114,828)


boo$V3[ix_label] <- rownames(boo)[ix_label]

library(ggrepel)
ggplot(boo, aes(log2(V2.x),log2(V2.y), label = V3)) +
  geom_point(color = boo$colors,size = ifelse(boo$V3 == "", 2, 4))+
  geom_text_repel(size=4) + theme_bw() + theme(axis.text=element_text(size=12),
                                               axis.title=element_text(size=14,face="bold")) +
  labs(x= "log2(Counts for Peromyscus)", y="log2(Counts for Mouse)",title = "Pfam analysis") +
  xlim(0, 10) + ylim(0, 10)

boo$colors=""
boo$colors[boo$V3==""]="#253494"
#Antimicrobial-immune
boo$colors[(boo$V3!="") & (boo$Domain == "MSG" ) ] ="#66a61e"
boo$colors[(boo$V3!="") & (boo$Domain == "Defensin_beta" ) ] ="#66a61e"
boo$colors[(boo$V3!="") & (boo$Domain == "Zeta_toxin" ) ] ="#66a61e"

#chromatin associated
boo$colors[(boo$V3!="") & (boo$Domain == "GATA" ) ] ="#f03b20"
boo$colors[(boo$V3!="") & (boo$Domain == "AlbA_2" ) ] ="#f03b20"
boo$colors[(boo$V3!="") & (boo$Domain == "KRAB" ) ] ="#f03b20"
boo$colors[(boo$V3!="") & (boo$Domain == "Nucleoplasmin" ) ] ="#f03b20"

#Enzymes
boo$colors[(boo$V3!="") & (boo$Domain == "COesterase" ) ] ="#ffd92f"
boo$colors[(boo$V3!="") & (boo$Domain == "Aldedh" ) ] ="#ffd92f"

#no labels
ggplot(boo, aes(log2(V2.x),log2(V2.y))) +
  geom_point(color = boo$colors,size = ifelse(boo$V3 == "", 2, 4))+
  theme_bw() + theme(axis.text=element_text(size=12),
                     axis.title=element_text(size=14,face="bold")) +
  labs(x= "log2(Counts for Peromyscus)", y="log2(Counts for Mouse)",title = "Pfam analysis") +
  xlim(0, 10) + ylim(0, 10)



#Dr. Barbour table
Barbour <- read.delim("PFam_Pero_Mouse2_BarbourA.txt", sep="\t", header = TRUE)
View(Barbour2)

#column to rownames
Barbour2 <- Barbour[,-1]
rownames(Barbour2) <- Barbour[,1]

Barbour2$V3 <- ""
ix_label <- c(1,8,12,14,22,46,54,59,78,6033,6065,6204,6337,6338,6341,6342,6343,6344,6345,6347,6346)


Barbour2$V3[ix_label] <- rownames(Barbour2)[ix_label]




Barbour2$colors=""
Barbour2$colors[Barbour2$V3!=""]="red"
Barbour2$colors[Barbour2$V3==""]="#253494"

Barbour2$NPero1<- Barbour2$normPero+ 1
Barbour2$NMus1 <- Barbour2$normMus+ 1

library(ggrepel)
ggplot(Barbour2, aes(log2(NPero1),log2(NMus1), label = V3)) +
  geom_point(color = Barbour2$colors,size = ifelse(Barbour2$V3 == "", 2, 4))+
  theme_bw() + theme(axis.text=element_text(size=12),
                                               axis.title=element_text(size=14,face="bold")) +
  labs(x= "log2(Counts for Peromyscus)", y="log2(Counts for Mouse)",title = "Pfam analysis") +
  xlim(0, 10) + ylim(0, 10)



write.table(boo, "PFam_Pero_Mouse.txt", sep="\t")
