<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h1>Applications</h1>
				<ol>
					<xsl:for-each select="developer/application">
						<!-- xsl:sort select="name"/-->
							<xsl:choose>
								<xsl:when test="price &lt; 20">
									<li style="background-color : yellow">
										<span class="id">
											<xsl:value-of select="id"></xsl:value-of>
										</span>
										<span class="name">
											<xsl:value-of select="name"></xsl:value-of>
										</span>
										<span class="price">
											<xsl:value-of select="price"></xsl:value-of>
										</span>
									</li>
								</xsl:when>
								<xsl:when test="price &lt; 30">
									<li style="background-color : blue">
										<span class="id">
											<xsl:value-of select="id"></xsl:value-of>
										</span>
										<span class="name">
											<xsl:value-of select="name"></xsl:value-of>
										</span>
										<span class="price">
											<xsl:value-of select="price"></xsl:value-of>
										</span>
									</li>
								</xsl:when>
								<xsl:otherwise>
									<li style="background-color : red">
										<span class="id">
											<xsl:value-of select="id"></xsl:value-of>
										</span>
										<span class="name">
											<xsl:value-of select="name"></xsl:value-of>
										</span>
										<span class="price">
											<xsl:value-of select="price"></xsl:value-of>
										</span>
									</li>
								</xsl:otherwise>
							</xsl:choose>
					</xsl:for-each>
				</ol>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>