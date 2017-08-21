<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <h1>Hello <xsl:value-of select="/catalog/@foo" /></h1>
            <xsl:for-each select="//book">
                <xsl:sort select="title" />
                <p><xsl:value-of select="./title" /> von <xsl:value-of select="author" /> </p>
            </xsl:for-each>
            hello world
        </html>
    </xsl:template>

</xsl:stylesheet>
