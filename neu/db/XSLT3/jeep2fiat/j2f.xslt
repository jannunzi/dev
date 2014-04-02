<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/cars">
		<macchine>
			<xsl:for-each select="models/model">
				<xsl:sort select="msrp" order="descending"/>
				<xsl:choose>
					<xsl:when test="seats &gt; 6">
						<modelli-grandi>
							<nome><xsl:value-of select="name"/></nome>
							<siede><xsl:value-of select="seats"/></siede>
							<prezzo><xsl:value-of select="msrp"/></prezzo>
						</modelli-grandi>
					</xsl:when>
					<xsl:when test="seats &lt; 6">
						<modelli-piccoli>
							<nome><xsl:value-of select="name"/></nome>
							<siede><xsl:value-of select="seats"/></siede>
							<prezzo><xsl:value-of select="msrp"/></prezzo>
						</modelli-piccoli>
					</xsl:when>
				</xsl:choose>
				<xsl:if test="seats &lt; 6">
				</xsl:if>
			</xsl:for-each>
		</macchine>
	</xsl:template>
</xsl:stylesheet>