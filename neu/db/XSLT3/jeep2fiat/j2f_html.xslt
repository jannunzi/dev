<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/cars">
		<html>
			<head>
			</head>
			<body>
				<h1>Macchine</h1>
				
				<table>
					<tr>
						<th>Nome</th>
						<th>Siede</th>
						<th>Prezzo</th>
					</tr>
				
				<xsl:for-each select="models/model">
					<xsl:sort select="msrp" order="descending"/>
				
					<tr>
					
						<td><xsl:value-of select="name"/></td>
						<td><xsl:value-of select="seats"/></td>
						<td><xsl:value-of select="msrp"/></td>
					
					</tr>
					
				</xsl:for-each>
				
				</table>
				
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>