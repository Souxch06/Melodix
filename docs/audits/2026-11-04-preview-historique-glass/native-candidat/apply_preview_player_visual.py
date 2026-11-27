#!/usr/bin/env python3
"""Preview player presentation only; never changes player commands or data."""
from pathlib import Path
import hashlib
import json

EXPECTED = {
    'res/layout/activity_main.xml': '5de71b1a2a27cd0710ecc285d190301c05952e767d1e0e1dafe3f1b21a9ababb',
    'res/layout-w600dp/activity_main.xml': 'ff923fa2c85610655a4139409713434a4e7d933193baa48fcd5c16771ebaeba3',
    'res/drawable/native_player_background.xml': '0dcb1e1d8d94ee6b297250e92cca2ca770ac5555b41b6986746a7ce904bebcf4',
    'res/drawable/native_button_white.xml': '11d9172eac04718f095f936dc1bb0c68cea4041e1410f77ef56eb2b8cd502099',
    'res/drawable/widget_progress_drawable.xml': '6c186a221e3661881e1bde06766f3eab3a518b68a80a75797c3c357d9a3b5e3e',
    'res/drawable/native_cover_placeholder.xml': '7de3b7388690db7fe29181beebcdf2095d71f2e7901f142f1fd0ce4f6d89f554',
}

EXTRAS = {
    'smali/PreviewPlayerChrome$1.smali': 'bab70d5a387918508a1f29477df6188f782240831d3622a6396892002b25e8e9',
    'smali/PreviewPlayerChrome$2.smali': '18954c61e8a5e476d9bac575ee829a99369da243d8335b2f22b62f7a3aa6e0cb',
    'smali/PreviewPlayerChrome$3.smali': 'a71bb52bfde1ac0032e0e282695283beea82d06d675b217e814ca760d3b68661',
    'smali/PreviewPlayerChrome$4.smali': '1da2c88263ee81554c0dcb75a59dc43fd215e9428355caed4257038d49fd3aac',
    'smali/PreviewPlayerChrome$5.smali': 'f7f82c28e920aeb80f9f8aec0d3b1d6eaf023e91a201bcaf71eadf0f0e378662',
    'smali/PreviewPlayerChrome$6.smali': '152a4ecea04e1b269caf315e833906b90a4a97af8f3541d6999bf6ff59a78339',
    'smali/PreviewPlayerChrome$DismissGesture$1.smali': '041c3ab560e2f97198e2e7455eed75876ee230fffbb0d0d6c42a43061925d766',
    'smali/PreviewPlayerChrome$DismissGesture.smali': '1e57a15a151584fc67d8762871a56887261cc1c1ebc3eb5e22d6c667d2c25855',
    'smali/PreviewPlayerChrome$PressEffect.smali': '290cb5a68a44ee9ac559d8accc44b875cb63adf44fee8c911aa4d2fd202eaba6',
    'smali/PreviewPlayerChrome.smali': 'f007f1f35a432a29da35922da1a2dc0b21f52433ac3fd95388d1f359f4603411',
    'smali/PreviewPlayerLikeArt.smali': 'e067ca6f585d3f9cb61b8c2d4aecf74948ee4d0ff31cb454ebd265b9b884962c',
    'smali/PreviewPlayerMode$1.smali': '94964a389eb3ed4abd80f2a4298a86cb387a0b418b61e40b9a3b8fb176be37db',
    'smali/PreviewPlayerMode$2.smali': '2c5e9ac6f352f9ce5a5fce8c91eed2c35b64aa96d7b0cff1bacb21beb68efb89',
    'smali/PreviewPlayerMode$3.smali': '011085acc8d807e5acac4368780e22b5cf11d5f0a6775f8fc2d55783711ce5dd',
    'smali/PreviewPlayerMode$4.smali': 'e5e72d54e8151db7f6567b2206d023abc1b5350a3954072a7477c97dd7fcdd13',
    'smali/PreviewPlayerMode$5.smali': 'b5d6c8c3cb54a395c9968a0ad46862f9c74192485741458d4bd9096188f9a9c8',
    'smali/PreviewPlayerMode$6.smali': '3deeff626023776451467ce430879acca7891465da631c9addec44aec51e9201',
    'smali/PreviewPlayerMode$7$1.smali': 'c820e066ba6caf67bbdf7be0c71e4d5257d4a5df0bffa284ca8938f98189cf83',
    'smali/PreviewPlayerMode$7.smali': 'a97765ad0dcc71180edfb14134b910040aabdf42ea2b095c8793b0931c414f62',
    'smali/PreviewPlayerMode$8.smali': 'f59845ece13d6b979b46be3798d9886834f5038ecf2c5a8446a43d4cfa579514',
    'smali/PreviewPlayerMode$9.smali': 'ddc747047b2515641868b931c6caf209d88f72520cf8824088e095458e520005',
    'smali/PreviewPlayerMode.smali': '36219187a46c5f2caa3e5536f420f49f5974ab46b251a72f1d9be74ffa4e614a',
    'smali/PreviewPlayerSheet$1.smali': 'cf1bc54f3e8ff70fe487a5c382019af6a1f51890fdfadc9000e960fbdb2aad18',
    'smali/PreviewPlayerSheet$2.smali': 'b8d06f4f6a6f0be5eb3a4b052ccd2396051c0d146a0b618ce4fee32ec08ae881',
    'smali/PreviewPlayerSheet$3.smali': '53511768f4b815641c4b0f8a16e03087f72b64250f65f7958caab405b78e7dac',
    'smali/PreviewPlayerSheet.smali': '1ddc9bdb2ba655c51604da4d3cb9b5e52ebb18a0992aed5ce2f35421192177eb',
    'smali/PreviewPlayerTiles$1.smali': 'f1312ef993a56444b24c8cc2b2b5d2b4c8f842180bf0031882304a8558623ff5',
    'smali/PreviewPlayerTiles$10.smali': '2250355e1c708ef8fe6346d0c827c4ab37ca0fa35d8ff2d191dc483c01d16a04',
    'smali/PreviewPlayerTiles$11.smali': 'bf4aa88f96608a8a239331111ff37ec7f3b97d27241ae8827568af2a23547ce0',
    'smali/PreviewPlayerTiles$12.smali': '02447f6b4457f2f72666bfbf97b33ff7b35da952f07b65d9358d6d9176bb4993',
    'smali/PreviewPlayerTiles$13.smali': '020f201ad3aed3b353e0e122195519e3008530f1574448aa92534b8f0b40d18a',
    'smali/PreviewPlayerTiles$14.smali': '1bb6ce1e4fa02d573784c2e5c953348685df56442c48e4aa86c15a312b70162e',
    'smali/PreviewPlayerTiles$15.smali': '2a14f3c34649e5770c861214df2466d657758ba6986afd2f3207668b05891cc1',
    'smali/PreviewPlayerTiles$16.smali': 'bb4dbb65ee263008dd47ebfb1c2db405f7e0e1d05c05dacecc4bbeaddf79ab61',
    'smali/PreviewPlayerTiles$17.smali': 'd8dc6e0524f5611285ce3e7258dea2485ec7cb4704504327a7eea0743ba290a1',
    'smali/PreviewPlayerTiles$18.smali': '599a979293f8b07c0691f48bc88d74c2c79c3e503fbaeb64322601c6caa545d2',
    'smali/PreviewPlayerTiles$19.smali': '7ec2e55e11aa72c20ae11258c98a29815d3022bc200d9a113b5380ee8c7baac0',
    'smali/PreviewPlayerTiles$2.smali': '70e83d2dd2669934c0e717bd663563684f037048c58ffcfa83faef3764b915bd',
    'smali/PreviewPlayerTiles$20.smali': '30bd99fdef12fbe6b4b4c506348b55cbc39979630c1c6ba70fa45aff4c0ae84d',
    'smali/PreviewPlayerTiles$21.smali': '3cbc92694221671ba4ee5f1d59fc53a0646f4aa133d727ae75b6d9b104c1f58f',
    'smali/PreviewPlayerTiles$3.smali': '29d80088aabfd19dffa48738589d14cd9e289ebde4f8313df586e2688dea0f0c',
    'smali/PreviewPlayerTiles$4.smali': '480bb664afe48fb569b0822b9e52e8918d36a3cf157a5cf41440b55c1b3201a6',
    'smali/PreviewPlayerTiles$5.smali': 'f1903b7137fcc2fbcdfb7b47e232878fae3adda40278d3ef9bcc97ab51d9a4bd',
    'smali/PreviewPlayerTiles$6.smali': '1f9afb5cc3770b90b8a45af3edca4ed97621c48bf1e518ee911b256c92271fea',
    'smali/PreviewPlayerTiles$7.smali': 'c472d06e30847653fc825e2e338a1ec6165f7b370a3a7bc221cda91a0e68a5df',
    'smali/PreviewPlayerTiles$8.smali': 'caade90f7c3f19453fb71feda54e595e5d33527e21e7c6015ac9719d8d4f8c85',
    'smali/PreviewPlayerTiles$9.smali': '0df07aedbe696ce94cd9484ec06b4528e7bdb0c7c0aaa5b5236259c8bce66a43',
    'smali/PreviewPlayerTiles$22.smali': '26ce61baef70187ff352e92c5d4ec5f627fbdc00e735a1fd9bd348b6ffaf32c3',
    'smali/PreviewPlayerTiles$6$1.smali': 'ba99a9d7f60202ef8b004543fc1acc07ce20cab7e64ee9db996d9d4f54cc4181',
    'smali/PreviewPlayerTiles$6$2.smali': '16e308fca7d1fd7123ebbbd9814dfbaa0aed2b013e49a9675e3eed8a50e27f13',
    'smali/PreviewPlayerTiles$9$1.smali': '5f16c270d7696416ae93ee47651743340094f7953dea55536d06a9cd6fc408c2',
    'smali/PreviewPlayerTiles$6$3.smali': 'e9cca4eaee26d01fa811ccfa481bc0f7a34e58df894bdde26cc4444e0a88a5f8',
    'smali/PreviewPlayerTiles$23.smali': '47bd66c2d4f8c8e4a012e48f65bfb70e2f45daf2d277252b2bef775d30076f02',
    'smali/PreviewPlayerTiles$24.smali': '6d816964e9d5d5e9a609280475ac77d6c57e7841f6bc60846b70b3362093986a',
    'smali/PreviewPlayerTiles$25.smali': '562896fded9858c426f591fe971cb184cd40cfdb7b2147d5a3853cf11e2fec9f',
    'smali/PreviewPlayerTiles$26.smali': '55c3d22d2689d8fa7c312202f1e707e2e77ff0924ac5157ae88c2a717872dccc',
    'smali/PreviewPlayerTiles$27.smali': '8b83458553adafa90365d0df6a890f6c8def32a6b7e645fd46c0b22ae1254b1c',
    'smali/PreviewPlayerTiles$28.smali': '741e9f16af21abc5eef48578e4ed4224e43c311729243c92ae39f119bb23f6db',
    'smali/PreviewPlayerTiles$23$1.smali': '233379ebe88fabe1f74fae8c04a032a9866a989adbd837194386de98324f3c44',
    'smali/PreviewPlayerTiles$24$1.smali': 'ca415d3ef2872809b2f146ec407c06c5711567e5863ec2ce325d9af43a6e785f',
    'smali/PreviewPlayerTiles$29.smali': '0aaa0d3c2d4b5179bdd699f91610b8af4ad7eb41e93774fa98551922d9d2d957',
    'smali/PreviewPlayerTiles$30.smali': 'fd8fab2f3981046d2843555562031834df344c402f427838e4cc2aa257f1867f',
    'smali/PreviewPlayerTiles.smali': '7214396a8b870e7ba59c0da710477ddff2cb92ddbc5164f838c98114e0153100',
    'smali/PreviewPlayerVolume$1.smali': 'a0540a84c256544ba6bcc91bf76ffa748ff48fa8f444acbb5a9a29383f2736e6',
    'smali/PreviewPlayerVolume$10.smali': '7198eff117107b1e02f2bf92c2c659801e82840487dbbbc049031558d7dd2f14',
    'smali/PreviewPlayerVolume$11$1.smali': '59398edd4f76324e9ab97c5ccd0e81afa5906cc20f8ba3068baf76c5e7546d03',
    'smali/PreviewPlayerVolume$11.smali': '3b59655f0de1681e2c7b77f683bf51ea61960a8d281c8ae63a38483ceb3c4d17',
    'smali/PreviewPlayerVolume$12.smali': 'f6bdc83bbd36cf4b79e1c0725ae644a38875baf991c1b0d524c41244d503cd23',
    'smali/PreviewPlayerVolume$13.smali': '48cf22b293a1fd74b5534275f2075ee13d9a04317919a209d85915e2e91a5e8d',
    'smali/PreviewPlayerVolume$2.smali': '828616b4be9789c87071ad3e51c7418cefd239b4a4d5570ed2c98e3e6865c004',
    'smali/PreviewPlayerVolume$3.smali': 'e62fcbacf509774b65475d159f528978baf4caffc0e393a41b58faecd3fd3626',
    'smali/PreviewPlayerVolume$4.smali': '2855e600f35594a269963d9b87fb1c05912b103259232f99492f4e6ceebf2158',
    'smali/PreviewPlayerVolume$5.smali': '3088ea0de822c90492599f44f26a789317e88d64a1fd75689926b657df0637fa',
    'smali/PreviewPlayerVolume$6.smali': '11ec9707fe834638f7b83cd4e1ea666a6958d2b05838f457b593b93f9747cb7c',
    'smali/PreviewPlayerVolume$7.smali': '8e1351f4db9c97a69c1365f6e2aaba84c9119275c67057ead7efe9fe2bc110bd',
    'smali/PreviewPlayerVolume$8.smali': '4afb8ff39581f2950ff75912d49f6c28ef9943c423ee44a4452fdf88fad2f937',
    'smali/PreviewPlayerVolume$9.smali': 'd1d07ee161198f6955f3623685cbe3a582990a413d1fa9bde17fb6b92cfecd91',
    'smali/PreviewPlayerVolume.smali': '70fd2f5eecb8510d494be8f793af8f0084ddadbc676667c773052f97fefb0a71',
    'smali/PreviewSnapshotRenderer.smali': 'b2dec79e45419f507ab50580f23b150735089a80efce9791496eb4a0f3fdeb3d',
    'smali/PreviewUiRestyle$1.smali': 'dddac451750dc1b64e7af0cc2719ccee85e27f27c0cdbc4dbc693a7f26fc58a6',
    'smali/PreviewUiRestyle$2.smali': '2601527b244ae2ba2392494bcfce2ea82f763e344af45e92686416b4f65f9450',
    'smali/PreviewUiRestyle$3.smali': '93d0b52478b2f64b3f9bd282a830527e518f0c59095fb0b1396513257e1c14c5',
    'smali/PreviewUiRestyle$4.smali': '50986557550b543d2c9559c5a3997d7f64e01ba19515f887839b0385f20996ec',
    'smali/PreviewUiRestyle.smali': 'a5b19105c14690be3dcedcd791372aebc5211f4e5a66296daa755ecfa95ef78d',
    'PreviewSnapshotRenderer.java': 'f38bef2d8c619ca21da150940921b8e0fd6d219743ee86eb20cc3a85bd1f7369',
    'PreviewPlayerPlayButton.java': '7b080ee533f8e3c2be8d2bba9457d0bf51c32fa44606d4e7fd4604af5189e36a',
    'PreviewPlayerDecoration.java': 'a21b4dffe6c2ba7cbce2d29012e601b88c1a5ac43b56d6cf5b578f0bc104f44d',
    'smali/PreviewPlayerPlayButton.smali': '10fa7289606a9481f8f6af0cac9e36790c1bf1ba73d9218d551ad194e9287e27',
    'smali/PreviewPlayerPlayButton$1.smali': '4fd83f3fd7382c2861383c9b7197d59d28b8dc96808e0cd32f157ccddb4af3a0',
    'smali/PreviewPlayerDecoration.smali': 'd6603b418eaf73a509548f2f74b5a89489d5259dc8b52832f9c720ded5f96f41',
    'PreviewPlayerChrome.java': '47cc4a0b51365aee44a2e82b978f9211337a71d50426db15c08d6819e9ce6139',
    'PreviewPlayerLikeArt.java': '1fa852b84c4fbb28c68fadc4380f23290414a6c971ec280ad2650ffcdcb046f6',
    'PreviewPlayerMode.java': '30ab4f122ee1d39baf6e9b555282dc043d3e954c6416e2ca15b23d6ea3e6fe45',
    'PreviewPlayerTiles.java': 'd4d4aed5eda13dfbf2c7c664ec47017e064bedb01dde8409123c02bbc902943b',
    'PreviewPlayerVolume.java': 'c53183edbde315dfae898a120d794f630f594d4739dd1939b6ec9507c7612e0b',
    'control.js': '58376a501fdb2880cc8e68305fb01c82b03181ee82411614f12cfbb34fba07b7',
    'control-diagnostic.js': '67294cdbad572452c57c3ad1199740fbdc2bb609c6efa90c3c88109314484231',
    'volume-control.js': '3abc94938fb91e84e3e5173326d5547a80d32717b6d57e1bb64e63d90a9b67af',
    'panel-structure.js': '45bcd7ac9dba68aad908a47fd66fd96e2f4feeeabcf1fac3e19399fa150a71f8',
    'panel-read.js': 'e00691f3abe98da90b181e5755cb3674581b14a4f3199bbe23ba1459a2e53368',
    'mode-job.js': '1520fdf81946d802991aecc67df91e90fae3d691a88628062253e9db8c7183c0',
    'queue-job.js': '7fb05c212754d4706f071f40fdd5f80373273f06b199ddf13021ec8165f21239',
    'panel-job.js': '192fc2fdc08734b19a0904afbde508f99dfc456061f88737f7cb2d81b221b68e',
    'PreviewPlayerSheet.java': '9eb4bfe97b4efa4073b2f4a96a9c810951ce1c227da4f2d5db1bcfc252adc24e',
    'PreviewPanelIcon.java': '3d88ddf6ae86740688aa0e9fd6132271ea8fa975e3a134a67821447d5cc715c8',
    'smali/PreviewPanelIcon.smali': 'bce9635589dec66eb924da9cdefdc4698f7195a2a310690a58b6462203094251',
}

def one(s, old, new):
    if s.count(old)!=1: raise ValueError('unexpected player layout: '+old[:80])
    return s.replace(old,new,1)

def player_layout(source):
    start=source.index('        <ScrollView\n            android:id="@id/nativePlayerPanel"')
    end=source.index('        </ScrollView>',start)+len('        </ScrollView>')
    panel=source[start:end]
    panel=one(panel,'android:paddingLeft="16.0dip"','android:paddingLeft="24.0dip"')
    panel=one(panel,'android:paddingRight="16.0dip"','android:paddingRight="24.0dip"')
    panel=one(panel,'android:paddingTop="10.0dip"','android:paddingTop="12.0dip"')
    panel=one(panel,'android:paddingBottom="18.0dip"','android:paddingBottom="24.0dip"')
    marker='            <LinearLayout android:orientation="vertical" android:gravity="center" android:layout_width="fill_parent" android:layout_height="wrap_content">\n'
    header='''            <LinearLayout android:orientation="horizontal" android:gravity="center_vertical" android:layout_width="fill_parent" android:layout_height="wrap_content" android:minHeight="48.0dip">
                <ImageButton android:src="@drawable/ic_arrow_down_24dp" android:tint="#ffffffff" android:scaleType="centerInside" android:padding="10.0dip" android:background="@drawable/native_button_dark" android:layout_width="48.0dip" android:layout_height="48.0dip" android:onClick="onNativeBackClick" android:contentDescription="Réduire le lecteur" />
                <TextView android:tag="previewPlayerDragHandle" android:contentDescription="Glisser vers le bas pour réduire le lecteur" android:text="LECTURE EN COURS" android:gravity="center" android:textSize="11.0sp" android:textStyle="bold" android:letterSpacing="0.14" android:textColor="#ffcfc6f2" android:layout_width="0.0dip" android:layout_height="wrap_content" android:layout_weight="1.0" />
                <Space android:tag="previewPlayerHeaderSpacer" android:layout_width="48.0dip" android:layout_height="48.0dip" />
            </LinearLayout>
'''
    panel=one(panel,marker,marker.replace('android:gravity="center"','android:gravity="top"')+'            <com.melodix.music.PreviewPlayerChrome android:tag="previewPlayerChrome" android:layout_width="0.0dip" android:layout_height="0.0dip" />\n'+header)
    old='''            <androidx.cardview.widget.CardView
                android:layout_width="272.0dip"
                android:layout_height="272.0dip"
                android:layout_marginTop="8.0dip"
                android:layout_marginBottom="22.0dip"
                app:cardBackgroundColor="#ff282828"
                app:cardCornerRadius="8.0dip"
                app:cardElevation="18.0dip">'''
    new='''            <androidx.constraintlayout.widget.ConstraintLayout
                android:tag="previewPlayerArtFrame" android:layout_width="fill_parent" android:layout_height="wrap_content"
                android:layout_marginTop="16.0dip" android:layout_marginBottom="20.0dip">
              <androidx.cardview.widget.CardView
                android:tag="previewPlayerArtCard" android:layout_width="0.0dip" android:layout_height="0.0dip"
                app:layout_constraintStart_toStartOf="parent" app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintTop_toTopOf="parent" app:layout_constraintDimensionRatio="1:1"
                app:layout_constraintWidth_max="318dp"
                app:contentPadding="1.0dip"
                app:cardBackgroundColor="#1fffffff" app:cardCornerRadius="30.0dip" app:cardElevation="26.0dip">'''
    panel=one(panel,old,new)
    panel=one(panel,'            </androidx.cardview.widget.CardView>','              </androidx.cardview.widget.CardView>\n            </androidx.constraintlayout.widget.ConstraintLayout>')
    panel=one(panel,'android:contentDescription="Current track artwork"','android:contentDescription="Pochette du titre"')
    panel=one(panel,'android:src="@drawable/logo_melodix"','android:src="@drawable/native_cover_placeholder"')
    panel=one(panel,'android:textSize="24.0sp"','android:textSize="23.0sp" android:fontFamily="sans-serif" android:textFontWeight="800"')
    panel=one(panel,'android:text="Open Spotify to start listening"','android:text="Lecture arrêtée"')
    panel=one(panel,'android:textSize="15.0sp"','android:textSize="16.0sp"')
    panel=panel.replace('android:textColor="#ffb3b3b3"','android:textColor="#ffc9c0ea"')
    # Align title and artist with the seek bar; retain identity and max lines.
    panel=panel.replace('android:gravity="center"\n                android:maxLines=', 'android:gravity="start"\n                android:maxLines=')
    panel=one(panel,'android:paddingTop="4.0dip"','android:paddingTop="6.0dip"')
    artist_start=panel.index('android:id="@id/nativePlayerLargeArtist"')
    artist_end=panel.index('/>',artist_start)
    artist=panel[artist_start:artist_end].replace('android:maxLines="1"','android:maxLines="2"')
    panel=panel[:artist_start]+artist+panel[artist_end:]
    # The existing player title keeps its ID; the adjacent like is an
    # independently guarded optional command, disabled until observed.
    i=panel.index('            <TextView\n                android:id="@id/nativePlayerLargeTitle"')
    j=panel.index('/>',i)+2
    title=panel[i:j].replace('android:layout_width="fill_parent"','android:layout_width="0.0dip" android:layout_weight="1.0"')
    title='''            <LinearLayout android:orientation="horizontal" android:gravity="center_vertical" android:layout_width="fill_parent" android:layout_height="wrap_content">
'''+title+'''
              <com.melodix.music.PreviewPlayerMode android:tag="like" android:layout_marginLeft="16.0dip" android:background="@drawable/native_button_dark" android:padding="10.0dip" android:layout_width="44.0dip" android:layout_height="44.0dip" android:contentDescription="Like indisponible" />
            </LinearLayout>'''
    panel=panel[:i]+title+panel[j:]
    badge='''            <TextView
                android:text="● Lu via Spotify"
                android:textSize="12.0sp"
                android:textStyle="bold"
                android:textColor="#ffa78bfa"
                android:gravity="center"
                android:paddingTop="6.0dip"
                android:layout_width="fill_parent"
                android:layout_height="wrap_content" />
'''
    panel=one(panel,badge,'')
    panel=one(panel,'android:thumbTint="#ffc0a2ff"','android:thumbTint="#ffffffff"')
    panel=one(panel,'android:maxHeight="6.0dip"','android:maxHeight="5.0dip"')
    seek_start=panel.index('android:id="@id/nativePlayerProgress"'); seek_end=panel.index('/>',seek_start)
    seek=panel[seek_start:seek_end].replace('android:layout_width="fill_parent"','android:layout_width="fill_parent" android:layout_marginLeft="-12.0dip" android:layout_marginRight="-12.0dip"').replace('android:layout_marginTop="16.0dip"','android:layout_marginTop="20.0dip"')
    panel=panel[:seek_start]+seek+panel[seek_end:]
    controls='            <LinearLayout\n                android:orientation="horizontal"\n                android:gravity="center"'
    panel=one(panel,controls,controls+' android:clipChildren="false" android:clipToPadding="false" android:paddingTop="8.0dip" android:paddingBottom="8.0dip"')
    for ident in ('nativePlayerPositionText','nativePlayerDurationText'):
        pos=panel.index('android:id="@id/'+ident+'"');stop=panel.index('/>',pos)
        segment=panel[pos:stop].replace('android:textSize="12.0sp"','android:textSize="12.0sp" android:fontFeatureSettings="tnum"')
        panel=panel[:pos]+segment+panel[stop:]
    marker_remaining='android:tag="nativePlayerRemaining"'
    if marker_remaining in panel:
        pos=panel.index(marker_remaining);stop=panel.index('/>',pos)
        segment=panel[pos:stop].replace('android:textColor="#ffc9c0ea"','android:textColor="#00ffffff"')
        segment=segment.replace('android:paddingBottom="8.0dip"','android:importantForAccessibility="yes" android:focusable="true" android:labelFor="@id/nativePlayerProgress"')
        segment=segment.replace('android:layout_width="fill_parent"','android:layout_width="1.0dip"').replace('android:layout_height="wrap_content"','android:layout_height="1.0dip"')
        panel=panel[:pos]+segment+panel[stop:]
    else:
        controls='            <LinearLayout\n                android:orientation="horizontal"\n                android:gravity="center"'
        remaining='            <TextView android:tag="nativePlayerRemaining" android:text="Temps restant : —" android:textSize="12.0sp" android:textColor="#00ffffff" android:importantForAccessibility="yes" android:focusable="true" android:labelFor="@id/nativePlayerProgress" android:layout_width="1.0dip" android:layout_height="1.0dip" />\n'
        panel=one(panel,controls,remaining+controls)
    for ident in ('nativePlayerShuffleButton','nativePlayerRepeatButton'):
        old='android:id="@id/'+ident+'"'; panel=one(panel,old,old+' android:visibility="gone"')
    for ident,mode,label in (('nativePlayerShuffleButton','shuffle','Aléatoire indisponible'),('nativePlayerRepeatButton','repeat','Répétition indisponible')):
        anchor='                <ImageView android:id="@id/'+ident+'"'
        control='                <com.melodix.music.PreviewPlayerMode android:tag="'+mode+'" android:background="@null" android:padding="10.0dip" android:layout_width="0.0dip" android:layout_weight="1.0" android:layout_height="48.0dip" android:contentDescription="'+label+'" />\n'
        panel=one(panel,anchor,control+anchor)
    for ident in ('nativePlayerPreviousButton','nativePlayerNextButton'):
        i=panel.index('android:id="@id/'+ident+'"'); j=panel.index('/>',i); part=panel[i:j]
        part=part.replace('android:layout_width="54.0dip"','android:layout_width="0.0dip" android:layout_weight="1.0"').replace('android:layout_height="54.0dip"','android:layout_height="56.0dip"').replace('android:layout_marginLeft="12.0dip"','').replace('android:layout_marginRight="12.0dip"','').replace('android:background="@drawable/native_button_dark"','android:background="@null"').replace('Previous track','Titre précédent').replace('Next track','Titre suivant')
        panel=panel[:i]+part+panel[j:]
    panel=one(panel,'<ImageView android:id="@id/nativePlayerLargePlayPauseButton"','<com.melodix.music.PreviewPlayerPlayButton android:id="@id/nativePlayerLargePlayPauseButton"')
    i=panel.index('android:id="@id/nativePlayerLargePlayPauseButton"');j=panel.index('/>',i)
    panel=panel[:i]+panel[i:j].replace('72.0dip','76.0dip').replace('android:padding="24.0dip"','android:padding="25.0dip"').replace('android:background="@drawable/native_button_white"','android:background="@drawable/native_button_white" android:elevation="12.0dip"').replace('android:layout_marginLeft="14.0dip"','').replace('android:layout_marginRight="14.0dip"','')+panel[j:]
    ending='''            </LinearLayout>
            </LinearLayout>
        </ScrollView>'''
    tiles='''            </LinearLayout>
            <Space android:tag="previewPlayerSpacer" android:layout_width="1.0dip" android:layout_height="0.0dip" android:layout_weight="1.0" />
            <com.melodix.music.PreviewPlayerTiles android:tag="previewPlayerTiles" android:layout_width="fill_parent" android:layout_height="wrap_content" android:layout_marginTop="20.0dip" />
            </LinearLayout>
        </ScrollView>'''
    panel=one(panel,ending,tiles)
    return source[:start]+panel+source[end:]

def landscape_layout(source):
    start=source.index('        <ScrollView\n            android:id="@id/nativePlayerPanel"')
    end=source.index('        </ScrollView>',start)+len('        </ScrollView>')
    panel=source[start:end]
    art='''            <androidx.constraintlayout.widget.ConstraintLayout
                android:tag="previewPlayerArtFrame" android:layout_width="fill_parent" android:layout_height="wrap_content"
                android:layout_marginTop="16.0dip" android:layout_marginBottom="20.0dip">'''
    landscape='''            <LinearLayout android:orientation="horizontal" android:gravity="top" android:layout_width="fill_parent" android:layout_height="wrap_content">
            <androidx.constraintlayout.widget.ConstraintLayout
                android:tag="previewPlayerArtFrame" android:layout_width="0.0dip" android:layout_weight="0.44" android:layout_height="wrap_content"
                android:layout_marginTop="12.0dip" android:layout_marginBottom="12.0dip" android:layout_marginRight="18.0dip">'''
    panel=one(panel,art,landscape)
    panel=one(panel,'            </androidx.constraintlayout.widget.ConstraintLayout>', '''            </androidx.constraintlayout.widget.ConstraintLayout>
            <LinearLayout android:orientation="vertical" android:layout_width="0.0dip" android:layout_weight="0.56" android:layout_height="wrap_content" android:layout_marginTop="12.0dip">''')
    ending='''            <Space android:tag="previewPlayerSpacer" android:layout_width="1.0dip" android:layout_height="0.0dip" android:layout_weight="1.0" />
            <com.melodix.music.PreviewPlayerTiles android:tag="previewPlayerTiles" android:layout_width="fill_parent" android:layout_height="wrap_content" android:layout_marginTop="20.0dip" />
            </LinearLayout>
        </ScrollView>'''
    panel=one(panel,ending,'''            <Space android:tag="previewPlayerSpacer" android:layout_width="1.0dip" android:layout_height="0.0dip" android:layout_weight="1.0" />
            <com.melodix.music.PreviewPlayerTiles android:tag="previewPlayerTiles" android:layout_width="fill_parent" android:layout_height="wrap_content" android:layout_marginTop="20.0dip" />
            </LinearLayout>
            </LinearLayout>
            </LinearLayout>
        </ScrollView>''')
    return source[:start]+panel+source[end:]

def apply(root):
    root=Path(root); data={}
    here=Path(__file__).resolve().parent/'preview-extras'
    for name,digest in EXTRAS.items():
        if hashlib.sha256((here/name).read_bytes()).hexdigest()!=digest: raise ValueError('unexpected optional control '+name)
    js=(here/'control.js').read_text(encoding='utf8')
    if json.dumps(js,ensure_ascii=True) not in (here/'PreviewPlayerMode.java').read_text(encoding='utf8'):
        raise ValueError('control script/source mismatch')
    if json.dumps((here/'control-diagnostic.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerMode.java').read_text(encoding='utf8'):
        raise ValueError('diagnostic script/source mismatch')
    if json.dumps((here/'volume-control.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerVolume.java').read_text(encoding='utf8'):
        raise ValueError('volume script/source mismatch')
    if json.dumps((here/'panel-structure.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerTiles.java').read_text(encoding='utf8'):
        raise ValueError('panel probe/source mismatch')
    if json.dumps((here/'panel-read.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerTiles.java').read_text(encoding='utf8'):
        raise ValueError('panel read/source mismatch')
    if json.dumps((here/'mode-job.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerMode.java').read_text(encoding='utf8'):
        raise ValueError('mode job/source mismatch')
    if json.dumps((here/'queue-job.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerTiles.java').read_text(encoding='utf8'):
        raise ValueError('queue job/source mismatch')
    if json.dumps((here/'panel-job.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerTiles.java').read_text(encoding='utf8'):
        raise ValueError('panel job/source mismatch')
    for name,digest in EXPECTED.items():
        raw=(root/name).read_bytes()
        if hashlib.sha256(raw).hexdigest()!=digest: raise ValueError('unexpected visual input '+name)
        data[name]=raw.decode('utf8')
    activity='smali/com/melodix/music/MainActivity.smali'
    original=(root/activity).read_text(encoding='utf8')
    entry='.method public final onNativeBackClick(Landroid/view/View;)V\n    .locals 6\n'
    hook=entry+'''    # Only the full-player view may defer Back for its close animation.
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerChrome;->interceptBack(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :preview_close_continue
    return-void
    :preview_close_continue
'''
    original=one(original,entry,hook)
    capture='''    :save_player_return_state
    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PushBack()V'''
    capture_hook='''    :save_player_return_state
    # Capture only the native shell before it is replaced by the player.
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerChrome;->captureBeforeExpand(Landroid/app/Activity;)V
    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PushBack()V'''
    data[activity]=one(original,capture,capture_hook)
    for name in list(EXPECTED)[:2]: data[name]=player_layout(data[name])
    for target,base in (('res/layout-land/activity_main.xml','res/layout/activity_main.xml'),
                        ('res/layout-w600dp-land/activity_main.xml','res/layout-w600dp/activity_main.xml')):
        if (root/target).exists(): raise ValueError('unexpected landscape layout '+target)
        data[target]=landscape_layout(data[base])
    data['res/drawable/native_player_background.xml']='''<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
  <item><shape><gradient android:angle="270" android:startColor="#ff2b1456" android:centerColor="#ff170b33" android:endColor="#ff0a0614" /></shape></item>
  <item android:gravity="top|left" android:width="260dp" android:height="260dp"><shape><gradient android:type="radial" android:gradientRadius="130dp" android:startColor="#737b3fe4" android:endColor="#007b3fe4" /></shape></item>
  <item android:gravity="bottom|right" android:bottom="150dp" android:width="240dp" android:height="240dp"><shape><gradient android:type="radial" android:gradientRadius="120dp" android:startColor="#59e0489e" android:endColor="#00e0489e" /></shape></item>
</layer-list>
'''
    data['res/drawable/native_button_white.xml']=data['res/drawable/native_button_white.xml'].replace('#7C3AED','#7B3FE4').replace('#DB2777','#E0489E').replace('android:angle="0"','android:angle="135"')
    progress=data['res/drawable/widget_progress_drawable.xml']
    progress=one(progress,'<gradient android:angle="0" android:startColor="#ff302b3b" android:endColor="#ff433b50" />','<gradient android:angle="0" android:startColor="#2effffff" android:endColor="#2effffff" />')
    progress=one(progress,'<gradient android:angle="0" android:startColor="#ff956fe9" android:centerColor="#ffc0a2ff" android:endColor="#ffe8d9ff" />','<gradient android:angle="0" android:startColor="#ff7b3fe4" android:endColor="#ffe0489e" />')
    data['res/drawable/widget_progress_drawable.xml']=progress
    # Shared decorative fallback only; the existing loader remains unchanged.
    data['res/drawable/native_cover_placeholder.xml']='''<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
  <item><shape><size android:width="96dp" android:height="96dp"/><gradient android:angle="135" android:startColor="#ff7b3fe4" android:centerColor="#ff2b1456" android:endColor="#ffe0489e"/></shape></item>
  <item android:gravity="center" android:width="48dp" android:height="48dp"><vector android:width="48dp" android:height="48dp" android:viewportWidth="24" android:viewportHeight="24"><path android:fillColor="#ffffffff" android:pathData="M2,11h1v2H2z M5,8h1v8H5z M8,5h1v14H8z M11,3h1v18h-1z M14,6h1v12h-1z M17,4h1v16h-1z M20,8h1v8h-1z M23,11h1v2h-1z"/></vector></item>
</layer-list>
'''
    for name,text in data.items():
        path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text,encoding='utf8')
    for name in EXTRAS:
        if name.startswith('smali/'):
            dest=root/'smali/com/melodix/music'/Path(name).name
            if dest.exists(): raise ValueError('optional controller already exists')
            dest.write_bytes((here/name).read_bytes())
