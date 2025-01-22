library(qqman)

#Plot Manhattan and QQplot

results <- read.table("gwas_output_with_ref_alt.txt", head = TRUE)
chr <- unique(results$chr)
results$chr <- as.numeric(factor(results$chr, levels = chr))
jpeg("GWAS_TL_manhattan.jpeg")
manhattan(results,chr="chr",bp="pos",p="Score.pval",snp="variant.id", suggestiveline = -log10(1e-05), genomewideline = -log10(5e-08), ylim = c(0,15), col = c("blue4", "orange3"), annottatePval = NULL, annotateTop = TRUE,main = "Manhattan plot: Telomere Length")
dev.off()

jpeg("GWAS_TL_QQ.jpeg")
qq(results$Score.pval, ylim = c(0,15), xlim = c(0,15), main = "Q-Q plot of GWAS p-values : log")
dev.off()
