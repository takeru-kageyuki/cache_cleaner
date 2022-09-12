<div align="center">
    <a href="#" title="Logo"><img src="assets/logo.png" alt="Logo" height="95"></a>
    <h2>Cache Cleaner</h2>
    <a href="https://github.com/takeru-kageyuki"><img src="https://img.shields.io/static/v1?label=author&message=Taka&color=brightgreen" alt="Author"></a>
    <a href="https://github.com/takeru-kageyuki/cache_cleaner/blob/main/LICENSE"><img src="https://img.shields.io/github/license/takeru-kageyuki/cache_cleaner?color=brightgreen" alt="License"></a>
    <a href="https://github.com/takeru-kageyuki/cache_cleaner/releases"><img src="https://img.shields.io/github/downloads/takeru-kageyuki/cache_cleaner/total?color=brightgreen" alt="Downloads"></a>
</div>
<p>:herb: A simple module that allows your device to clean all apps cache automatically if the total cache size is more than 1GB and can be done manually by typing <code>su -c cleaner</code> in the Terminal.</p>
<p><strong>This module will clears the apps cache in the following directories:</strong></p>
<ul>
    <li><code>/data/data/*/cache/*</code></li>
    <li><code>/data/data/*/code_cache/*</code></li>
    <li><code>/data/user_de/*/*/cache/*</code></li>
    <li><code>/data/user_de/*/*/code_cache/*</code></li>
    <li><code>/sdcard/Android/data/*/cache/*</code></li>
</ul>
<h2>Requirements:</h2>
<ul>
    <li>Android 5.0+</li>
    <li>Magisk v23.0+</li>
</ul>
<h2>Notes:</h2>
<ul>
    <li>To disable the automatic cleaning feature, create an empty file with the name <code>disable</code> in the <code>/sdcard/Taka/cache_cleaner</code> directory and to enable it just delete the <code>disable</code> file and type <code>su -c magisk --service</code> in the Terminal</li>
</ul>
<hr>
<p><strong><ins>Support Group!</ins></strong> :evergreen_tree:</p>
<p>:ear_of_rice: Don't forget to join my Telegram Group for more module updates.</p>
<p align="center"><a href="https://t.me/TakaEmpire_Discussion" title="Join my Telegram Group"><img src="assets/telegram.png" alt="Join my Telegram Group" height="40"></a></p>
<p>:herb: If you have an issue with the module, found a bug or have some questions, you can ask them there. ^^</p>
<hr>
<p><strong><ins>Support the developer!</ins></strong> :evergreen_tree:</p>
<p>:ear_of_rice: Want to support Taka further?<br>Help keep his projects alive by donating to him on Trakteer or Ko-fi.</p>
<p align="center">
    <a href="https://trakteer.id/takeru-kageyuki/tip" title="Support me on Trakteer"><img src="assets/trakteer.png" alt="Support me on Trakteer" height="40"></a>
    <a href="https://ko-fi.com/takeru_kageyuki" title="Support me on Ko-fi"><img src="assets/ko-fi.png" alt="Support me on Ko-fi" height="40"></a>
</p>
<p>:fallen_leaf: Please respect my hard work, if you're using any parts of this module don't forget to give credit from me.</p>
