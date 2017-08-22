<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="searchTerm" select="/catalog/@searchTerm"/>
    <xsl:variable name="sort" select="/catalog/@sort"/>
    <xsl:variable name="sortOrder" select="/catalog/@sortOrder"/>
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

    <xsl:template match="/">
        <html lang="en">
          <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous" />
          </head>
          <body>
          <div class="row">
            <div class="col-md-4"><h2>Booklib</h2></div>
            <div class="col-lg-7">
              <form method="post">
                <div class="input-group">
                    <input type="text" name="searchTerm" class="form-control" placeholder="Search for..." value="{$searchTerm}"/>
                  <select class="form-control" name="sort" onclick="document.forms[0].submit()">
                    <option value="ascending|price">Preis aufsteigend</option>
                    <option value="descending|price">Preis absteigend</option>
                    <option value="ascending|publish_date">Veröffentlichung aufsteigend</option>
                    <option value="descending|publish_date">Veröffentlichung absteigend</option>
                  </select>
                </div>
              </form>
            </div>
            <div class="col-md-1"></div>
          </div>
            <div class="row">
              <div class="col-md-3"></div>
                <div class="col-md-8" id="table">
                    <table class="table table-striped">
                      <thead>
                      <tr>
                          <th>Autor</th>
                          <th>Title</th>
                          <th>Preis</th>
                          <th>Veröffentlichung</th>
                          <th>Beschreibung</th>
                      </tr>
                      </thead>
                    <tbody>
                        <xsl:for-each select="//book">
                            <xsl:sort select="*[name() = $sort]" order="{$sortOrder}" />
                            <xsl:if test="contains(translate(./title,$smallcase,$uppercase), translate($searchTerm,$smallcase,$uppercase)) or
                                            contains(translate(./author,$smallcase,$uppercase), translate($searchTerm,$smallcase,$uppercase)) or
                                            contains(translate(./description,$smallcase,$uppercase), translate($searchTerm,$smallcase,$uppercase))">
                                <tr>
                                    <td><xsl:value-of select="./author" /></td>
                                    <td><xsl:value-of select="./title" /></td>
                                    <td><xsl:value-of select="./price" /></td>
                                    <td><xsl:value-of select="./publish_date" /></td>
                                    <td><xsl:value-of select="./description" /></td>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </tbody>
                   </table>
                </div>
              <div class="col-md-1"></div>
            </div>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
          </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
