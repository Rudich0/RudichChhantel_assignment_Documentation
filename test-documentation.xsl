<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Unit Test Documentation - RudichChhantel Assignment</title>
        <style>
          * { margin: 0; padding: 0; box-sizing: border-box; }
          body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            padding: 20px;
            line-height: 1.6;
          }
          .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
          }
          .header {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
            padding: 50px;
            text-align: center;
          }
          .header h1 {
            font-size: 3em;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
          }
          .header .subtitle {
            font-size: 1.3em;
            opacity: 0.95;
          }
          .assembly-info {
            background: #f8f9fa;
            padding: 20px;
            text-align: center;
            border-bottom: 3px solid #11998e;
          }
          .assembly-name {
            font-family: 'Courier New', monospace;
            font-size: 1.2em;
            color: #11998e;
            font-weight: bold;
          }
          .content {
            padding: 40px;
          }
          .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
          }
          .stat-card {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(17, 153, 142, 0.3);
            transition: transform 0.3s ease;
          }
          .stat-card:hover {
            transform: translateY(-5px);
          }
          .stat-number {
            font-size: 3em;
            font-weight: bold;
            margin-bottom: 10px;
          }
          .stat-label {
            font-size: 1.1em;
            opacity: 0.9;
          }
          .search-box {
            width: 100%;
            padding: 15px 20px;
            margin-bottom: 30px;
            border: 3px solid #11998e;
            border-radius: 10px;
            font-size: 1.1em;
            transition: all 0.3s ease;
          }
          .search-box:focus {
            outline: none;
            box-shadow: 0 0 20px rgba(17, 153, 142, 0.3);
          }
          .test-section {
            margin-bottom: 30px;
          }
          .section-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 25px;
            border-radius: 10px 10px 0 0;
            font-size: 1.3em;
            font-weight: bold;
          }
          .test-list {
            background: #f8f9fa;
            border-radius: 0 0 10px 10px;
            overflow: hidden;
          }
          .test-item {
            background: white;
            margin: 10px;
            padding: 20px;
            border-radius: 8px;
            border-left: 5px solid #11998e;
            transition: all 0.3s ease;
            cursor: pointer;
          }
          .test-item:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transform: translateX(5px);
          }
          .test-badge {
            display: inline-block;
            background: #11998e;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8em;
            font-weight: bold;
            margin-bottom: 10px;
          }
          .test-name {
            color: #2c3e50;
            font-family: 'Courier New', monospace;
            font-size: 1.1em;
            font-weight: bold;
            margin: 10px 0;
          }
          .test-summary {
            color: #555;
            margin: 10px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 5px;
            border-left: 3px solid #38ef7d;
          }
          .test-category {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 3px 10px;
            border-radius: 15px;
            font-size: 0.75em;
            margin-right: 5px;
          }
          .legend {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
          }
          .legend-title {
            font-weight: bold;
            margin-bottom: 15px;
            font-size: 1.2em;
            color: #2c3e50;
          }
          .legend-items {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
          }
          .legend-item {
            display: flex;
            align-items: center;
            gap: 10px;
          }
          .legend-badge {
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: bold;
          }
          .badge-moveto { background: #3498db; color: white; }
          .badge-drawto { background: #9b59b6; color: white; }
          .badge-circle { background: #e74c3c; color: white; }
          .badge-rectangle { background: #f39c12; color: white; }
          .badge-pen { background: #1abc9c; color: white; }
          .badge-multiline { background: #34495e; color: white; }
          .badge-compile { background: #16a085; color: white; }
          .badge-factory { background: #d35400; color: white; }
          .badge-singleton { background: #8e44ad; color: white; }
        </style>
        <script>
          function searchTests() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const tests = document.getElementsByClassName('test-item');
            
            for (let i = 0; i &lt; tests.length; i++) {
              const text = tests[i].textContent.toLowerCase();
              tests[i].style.display = text.includes(input) ? 'block' : 'none';
            }
          }
          
          function getTestCategory(name) {
            if (name.includes('MoveTo')) return 'MoveTo Tests';
            if (name.includes('DrawTo')) return 'DrawTo Tests';
            if (name.includes('Circle')) return 'Circle Tests';
            if (name.includes('Rectangle')) return 'Rectangle Tests';
            if (name.includes('Pen')) return 'Pen Tests';
            if (name.includes('Multiline')) return 'Multiline Tests';
            if (name.includes('Compile')) return 'Compile Tests';
            if (name.includes('Factory')) return 'Factory Tests';
            if (name.includes('Singleton')) return 'Singleton Tests';
            return 'Other Tests';
          }
        </script>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h1>🧪 Unit Test Documentation</h1>
            <div class="subtitle">Comprehensive Test Suite for Drawing Application</div>
          </div>
          
          <div class="assembly-info">
            <div class="assembly-name">
              <xsl:value-of select="doc/assembly/name"/>
            </div>
          </div>
          
          <div class="content">
            <div class="stats">
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'Test')])"/>
                </div>
                <div class="stat-label">Total Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'MoveTo')])"/>
                </div>
                <div class="stat-label">MoveTo Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'DrawTo')])"/>
                </div>
                <div class="stat-label">DrawTo Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'Circle')])"/>
                </div>
                <div class="stat-label">Circle Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'Rectangle')])"/>
                </div>
                <div class="stat-label">Rectangle Tests</div>
              </div>
              <div class="stat-card">
                <div class="stat-number">
                  <xsl:value-of select="count(doc/members/member[contains(@name, 'Factory')])"/>
                </div>
                <div class="stat-label">Factory Tests</div>
              </div>
            </div>
            
            <div class="legend">
              <div class="legend-title">📊 Test Categories</div>
              <div class="legend-items">
                <div class="legend-item">
                  <span class="legend-badge badge-moveto">MoveTo</span>
                  <span>Position tracking tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge badge-drawto">DrawTo</span>
                  <span>Line drawing tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge badge-circle">Circle</span>
                  <span>Circle drawing tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge badge-rectangle">Rectangle</span>
                  <span>Rectangle drawing tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge badge-pen">Pen</span>
                  <span>Color setting tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge badge-multiline">Multiline</span>
                  <span>Program execution tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge badge-compile">Compile</span>
                  <span>Parameter validation tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge badge-factory">Factory</span>
                  <span>Command creation tests</span>
                </div>
                <div class="legend-item">
                  <span class="legend-badge badge-singleton">Singleton</span>
                  <span>Pattern implementation tests</span>
                </div>
              </div>
            </div>
            
            <input type="text" id="searchInput" class="search-box" placeholder="🔍 Search tests by name or description..." onkeyup="searchTests()"/>
            
            <xsl:call-template name="test-section">
              <xsl:with-param name="category">MoveTo Tests</xsl:with-param>
              <xsl:with-param name="badge-class">badge-moveto</xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="test-section">
              <xsl:with-param name="category">DrawTo Tests</xsl:with-param>
              <xsl:with-param name="badge-class">badge-drawto</xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="test-section">
              <xsl:with-param name="category">Circle Tests</xsl:with-param>
              <xsl:with-param name="badge-class">badge-circle</xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="test-section">
              <xsl:with-param name="category">Rectangle Tests</xsl:with-param>
              <xsl:with-param name="badge-class">badge-rectangle</xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="test-section">
              <xsl:with-param name="category">Pen Tests</xsl:with-param>
              <xsl:with-param name="badge-class">badge-pen</xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="test-section">
              <xsl:with-param name="category">Multiline Tests</xsl:with-param>
              <xsl:with-param name="badge-class">badge-multiline</xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="test-section">
              <xsl:with-param name="category">Compile Tests</xsl:with-param>
              <xsl:with-param name="badge-class">badge-compile</xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="test-section">
              <xsl:with-param name="category">Factory Tests</xsl:with-param>
              <xsl:with-param name="badge-class">badge-factory</xsl:with-param>
            </xsl:call-template>
            
            <xsl:call-template name="test-section">
              <xsl:with-param name="category">Singleton Tests</xsl:with-param>
              <xsl:with-param name="badge-class">badge-singleton</xsl:with-param>
            </xsl:call-template>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="test-section">
    <xsl:param name="category"/>
    <xsl:param name="badge-class"/>
    <xsl:variable name="tests" select="doc/members/member[contains(@name, substring-before($category, ' '))]"/>
    
    <xsl:if test="count($tests) &gt; 0">
      <div class="test-section">
        <div class="section-header">
          <xsl:value-of select="$category"/> (<xsl:value-of select="count($tests)"/>)
        </div>
        <div class="test-list">
          <xsl:for-each select="$tests">
            <div class="test-item">
              <span class="test-category {$badge-class}">
                <xsl:value-of select="$category"/>
              </span>
              <div class="test-name">
                <xsl:value-of select="substring-after(@name, ':')"/>
              </div>
              <xsl:if test="summary">
                <div class="test-summary">
                  ✓ <xsl:value-of select="summary"/>
                </div>
              </xsl:if>
            </div>
          </xsl:for-each>
        </div>
      </div>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
