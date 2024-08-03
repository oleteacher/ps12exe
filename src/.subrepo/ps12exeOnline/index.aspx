﻿<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="index.aspx.cs" Inherits="ps12exeOnline" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta charset="utf-8"/>
	<meta name="title" content="ps12exe Online"/>
	<meta name="description" content="A super cool online compiler for powershell scripts"/>
	<meta property="og:image" content="https://repository-images.githubusercontent.com/729678966/3ed3f02f-c7c9-4a18-b1f5-255e667643b6"/>
	<meta property="og:image:alt" content="A super cool online compiler for powershell scripts"/>
	<meta property="og:type" content="object"/>
	<meta property="og:title" content="ps12exe Online"/>
	<meta property="og:description" content="A super cool online compiler for powershell scripts"/>

	<title>ps12exe Online</title>
	<link rel="icon" type="image/x-icon" href="favicon.ico"/>
	<script src='https://www.midijs.net/lib/midi.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/darkreader"></script>
	<script>
		DarkReader.setFetchMethod(window.fetch)
		DarkReader.enable()
		var HighlightCode;
		function SetDarkMode(Set) {
			if (Set) DarkReader.enable()
			else DarkReader.disable()
			HighlightCode.useTheme(Set ? 'github-dark' : 'github')
		}
		(async ({ chrome, netscape }) => {
			if (!chrome && !netscape) await import('https://cdn.jsdelivr.net/npm/@ungap/custom-elements')
			HighlightCode = await import('https://cdn.jsdelivr.net/npm/highlighted-code/min.js').then(x => x.default)
			var dark = window.matchMedia('(prefers-color-scheme: dark)');
			SetDarkMode(dark.matches)
			dark.addEventListener('change', event => {
				SetDarkMode(event.matches)
			})
		})(self)
	</script>
</head>
<body>
	<form id="mainForm" runat="server">
		<textarea name="inputText" style="width: 98%; height:95vh;" is="highlighted-code" language="powershell" tabSize="4" placeholder="#_pragma noConsole
'Hello 世界！👾'
" id="inputText">#_pragma noConsole
'Hello 世界！👾'
</textarea>
		<br/>
		<asp:button id="compileButton" runat="server" Text="cum out"/>
		<a id="downloadLink" download="a.exe" runat="server"></a>
		<script type="text/javascript">
			const userInput = document.getElementById("inputText")
			var playing = false
			userInput.addEventListener("focus", event => {
				if (playing) MIDIjs.resume()
				else MIDIjs.play('https://raw.githubusercontent.com/steve02081504/ps12exe/master/src/bin/Unravel.mid', true)
				playing = true;
			})
			userInput.addEventListener("blur", event => MIDIjs.pause())
			const a = document.getElementById("downloadLink")
			const languageTextMap = {
				'zh-CN': '编译',
				'zh-TW': '編譯',
				'zh-HK': '編譯',
				'ru-RU': 'Скомпилировать',
				'ja-JP': 'コンパイル',
				'ko-KR': '컴파일',
				'es-ES': 'Compilar',
				'pt-PT': 'Compilar',
				'en-UK': 'Compile'
			};
			for (const key of Object.keys(languageTextMap)) languageTextMap[key.split('-')[0]] ??= languageTextMap[key]

			let language = navigator.language || navigator.userLanguage || 'en'
			if (!languageTextMap[language]) language = language.split('-')[0]
			if (!languageTextMap[language]) language = 'en'
			document.getElementById("compileButton").value = languageTextMap[language]
		</script>
	</form>
</body>
</html>
