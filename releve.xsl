<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="/releve">
        <html>
            <head>
                <title>
                    Relevés de comptes bancaires
                </title>
                <style>
                    body { 
                    font-family: Arial; 
                    margin: 20px; 
                    text-align: left; 
                    }
                    h1 { color: #ff8800; }
                    table { 
                    border-collapse: collapse; 
                    width: 70%; 
                    margin-top: 20px; 
                    margin-left: auto;
                    margin-right: auto;
                    }
                    th, td { 
                    border: 1px solid #333; 
                    padding: 8px; 
                    }
                    th { 
                    background-color: #e5e5e5; 
                    text-align: left; 
                    }
                    td {
                    text-align: center; 
                    }
                </style>
                <body>
                    <h1>  <strong>Relevés de comptes bancaires</strong> </h1>
                    <p><strong>RIB :</strong> <xsl:value-of select="@RIB"/></p>
                    <p><strong>Date du relevé :</strong> <xsl:value-of select="dateReleve"/></p>
                    <p><strong>Solde :</strong> <xsl:value-of select="solde"/> MAD</p>
                    <h2>Opérations du relevé</h2>
                    <p>                    
                        <strong> De </strong> <xsl:value-of select="operations/@dateDebut"/>
                        <strong>  à </strong> <xsl:value-of select="operations/@dateFin"/>
                    </p>
                    <table border="1" width="90%">
                        <tr>
                            <th>Type</th>
                            <th>Date</th>
                            <th>Montant</th>
                            <th>Description</th>
                        </tr>
                        
                        <xsl:for-each select="operations/operation">
                            <tr>
                                <td><xsl:value-of select="@type"/></td>
                                <td><xsl:value-of select="@date"/></td>
                                <td><xsl:value-of select="@montant"/></td>
                                <td><xsl:value-of select="@description"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </body>
            </head>
        </html>
    </xsl:template>
</xsl:stylesheet>