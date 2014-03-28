<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h1>Applications</h1>
				<p>
					<span class="id">
						<xsl:value-of select="developer/application/id"></xsl:value-of>
					</span>
					<span class="name">
						<xsl:value-of select="developer/application/name"></xsl:value-of>
					</span>
				</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>