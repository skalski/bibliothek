<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="searchTerm" select="/catalog/@searchTerm"/>
    <xsl:variable name="sort" select="/catalog/@sort"/>
    <xsl:variable name="sortOrder" select="/catalog/@sortOrder"/>
    <xsl:variable name="sortValue" select="/catalog/@sortValue"/>
    <xsl:variable name="minPrice" select="/catalog/@minPrice"/>
    <xsl:variable name="maxPrice" select="/catalog/@maxPrice"/>
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'"/>
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
                      integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous"/>
            </head>
            <body>
                <div class="row">
                    <div class="col-md-4">
                        <h2>Booklib</h2>
                    </div>
                    <div class="col-lg-7">
                        <form method="post" id="data">
                            <div class="input-group">
                                <input type="text" name="searchTerm" class="form-control" placeholder="Search for..." value="{$searchTerm}"/>
                                <select class="form-control" name="sort" onchange="document.forms[0].submit()">
                                    <xsl:choose>
                                        <xsl:when test="$sortValue = 'ascending|number(price)'">
                                            <option value="ascending|number(price)" selected="true">Preis aufsteigend</option>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <option value="ascending|number(price)">Preis aufsteigend</option>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$sortValue = 'descending|number(price)'">
                                            <option value="ascending|number(price)" selected="true">Preis absteigend</option>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <option value="ascending|number(price)">Preis absteigend</option>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$sortValue = 'ascending|publish_date'">
                                            <option value="ascending|publish_date" selected="true">Veröffentlichung aufsteigend</option>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <option value="ascending|publish_date">Veröffentlichung aufsteigend</option>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$sortValue = 'descending|publish_date'">
                                            <option value="descending|publish_date" selected="true">Veröffentlichung absteigend</option>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <option value="descending|publish_date">Veröffentlichung absteigend</option>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </select>
                                <input type="text" name="minPrice" class="form-control" value="{$minPrice}"/>
                                <input type="text" name="maxPrice" class="form-control" value="{$maxPrice}"/>
                                <input type="submit" style="position: absolute; left: -9999px"/>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <form method="post" id="book">
                            <div class="form-group">
                                <label for="bookName">Title of Book</label>
                                <input type="text" name="bookTitle" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="bookAuthor">Author</label>
                                <input type="text" name="bookAuthor" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="bookGenre">Genre</label>
                                <input type="text" name="bookGenre" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="bookPrice">Price without Currency</label>
                                <input type="text" name="bookPrice" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="bookPublish_date">Published at</label>
                                <input type="text" name="bookPublish_date" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="bookDescription">Description</label>
                                <textarea name="bookDescription" class="form-control"></textarea>
                            </div>
                            <button class="btn btn-default" type="submit">Add it</button>
                        </form>
                    </div>
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
                                    <xsl:sort select="*[name() = $sort]" order="{$sortOrder}"/>
                                    <xsl:if test="contains(translate(./title,$smallcase,$uppercase), translate($searchTerm,$smallcase,$uppercase)) or
                                            contains(translate(./author,$smallcase,$uppercase), translate($searchTerm,$smallcase,$uppercase)) or
                                            contains(translate(./description,$smallcase,$uppercase), translate($searchTerm,$smallcase,$uppercase))">
                                        <xsl:if test="number(./price) &gt; $minPrice and number(./price) &lt; $maxPrice">
                                            <tr>
                                                <td>
                                                    <xsl:value-of select="./author"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="./title"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="./price"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="./publish_date"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="./description"/>
                                                </td>
                                            </tr>
                                        </xsl:if>
                                    </xsl:if>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
                        integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
                <script src="./assets/send.js"></script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
