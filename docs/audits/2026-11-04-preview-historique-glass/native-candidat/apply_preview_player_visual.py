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
    'smali/PreviewPlayerChrome$1.smali': 'bd1720f5f0fae96a8a4a9189aa4dd08fc58d2495ded69fd17da44defe41ff4c3',
    'smali/PreviewPlayerChrome$2.smali': '98d6ef5e530db15f693b74bd94312ab67d3a5287c96c6cc2133d131884d683b6',
    'smali/PreviewPlayerChrome$3.smali': '82ef77016459b31aa273633a7632d30b501db93ef300a79c0f56767947c6d972',
    'smali/PreviewPlayerChrome$4.smali': 'f7777f760fbd098133313cbd0208914106ae29fb9295cbaebaa89375306e954f',
    'smali/PreviewPlayerChrome$5.smali': 'edaa7a09c081d6f10c044c81d2c2c2fd5db1f79bd1e0ed79ec3b2b35ed631458',
    'smali/PreviewPlayerChrome$DismissGesture$1.smali': '6175ccd68c3a7a70079e6055b3091fb18862e536f2dd0ae9a86fa857eedfe5a9',
    'smali/PreviewPlayerChrome$DismissGesture.smali': '0ccec83c26bb5f0d631c6d240b2e413c0429c2df31bfad29c0ebbb5a26168601',
    'smali/PreviewPlayerChrome$PressEffect.smali': '4c48d8402d9f35a913f8b328b2e3fddfd2941a30cac0649445da59c7ef4e2e49',
    'smali/PreviewPlayerChrome.smali': 'e78f2140e623481e39c87cfb67fc2ac764f612b8ee98599670c3333fb7231938',
    'smali/PreviewPlayerMode$1.smali': '9c00f7f4d1844157468c919ff2578c7620dc68e4a5fc827dbb541b65042deb9e',
    'smali/PreviewPlayerMode$2.smali': '3f28c76e2ebf1fa72d2015c73f97e01daea87faab8c1a2ce79bdc5ac5b5605ab',
    'smali/PreviewPlayerMode$3.smali': 'b8f3d398d56f6160a1222600159daf02d7d5d34f62a4a4a9c48b70f3e8c5717a',
    'smali/PreviewPlayerMode$4.smali': '9d977a3bd3f0dba835bb2021b66c88b7f53b155860948a98a79912a166fa138e',
    'smali/PreviewPlayerMode$5.smali': 'f86bd41f5629e82dbdd02c751ccaf343c4d9c79ec3d36d14534ac981b6d3b327',
    'smali/PreviewPlayerMode$6.smali': '9ce05fa10cc40c12040058e3a3d720ab144af7ce85ebf9b6695f11c2d4558f55',
    'smali/PreviewPlayerMode$7$1.smali': '6758ab1979644c969d0ab1603c0c2081ea86e8bfb0b435e7decd2d061afe70c5',
    'smali/PreviewPlayerMode$7.smali': '88d0417340249fec220a53b85037b8abbf6a232ad5217276bfa74979f544a422',
    'smali/PreviewPlayerMode$8.smali': 'bd9be4717c43825e5ceb8caae4f020c0e64acdafc60a6d05b47b5792147e17f1',
    'smali/PreviewPlayerMode$9.smali': 'd3e87f2fc5472ca00659c6a75f1c0e28fcea3684d684a67e1370a10ee30aca32',
    'smali/PreviewPlayerMode.smali': 'b7ffc838c4e88e8fc6078fd29617bac3ecb8fa0234fe1bde751323b127b5f705',
    'smali/PreviewPlayerTiles$1.smali': '8be7f09b8c09f41539ba9e04fb2ae367cc97add79d6a8cc0861d425b760f0522',
    'smali/PreviewPlayerTiles$10.smali': '798e3d7b136316036a9c7b86ebb3c1df454fb3150aa305e0095e0a64dc175864',
    'smali/PreviewPlayerTiles$11.smali': 'e45a7a4d35bbe3d10756c67b7fd091de806e6748b8aeb99a2ebc0cd6d13f2b36',
    'smali/PreviewPlayerTiles$12.smali': 'c277d99e5640cf8d381af4c6392654847ffd01658f1e39af81910aa78430da5d',
    'smali/PreviewPlayerTiles$13.smali': 'a92c3b109c60be3304611784c632396eba00e05f1c9b9c5f8e12afe29e586c13',
    'smali/PreviewPlayerTiles$14$1.smali': 'e5e62d93f2745c5b79b87cbb182431a5deae4a77f5854eb75f833cebc55b10e6',
    'smali/PreviewPlayerTiles$14.smali': 'c5a9d8e2882f82e868148e05deb6250767c135987cb9fd0fd313ecb4f2e40f78',
    'smali/PreviewPlayerTiles$15$1.smali': 'c3cc4c60d938017e106a158aafafd5d70067e0597907281e148d0857a4e7b65c',
    'smali/PreviewPlayerTiles$15.smali': 'ffa15b939a648d63e0e11330109946701eca8c4aa9c457bd88c8e2ef65cd1aec',
    'smali/PreviewPlayerTiles$16.smali': '00d20121f0971a16dd51e2b9b744a14cc276e34157fcf040eed8f978262db006',
    'smali/PreviewPlayerTiles$17.smali': '53ad58e5eb07686a81853117ded0ca90dd6d0e9c373626856e473944988f2dc0',
    'smali/PreviewPlayerTiles$18.smali': 'fa8fae8a879a4e05a2e6d9cf535a239e76cca66cbbee95d87a126945c4f29c79',
    'smali/PreviewPlayerTiles$19.smali': '93254eac59546195b32eaa90de0d3c840e8de18617fb1070835422393b2272f3',
    'smali/PreviewPlayerTiles$2.smali': '609c7ffaaaac829c82f49c1b9ec816dbca303647f3c78e1abaee9ec40b14d935',
    'smali/PreviewPlayerTiles$20.smali': '73414c2a3517551d0518db59ff1a94d6f88502f0691563d14372bb65e69a2070',
    'smali/PreviewPlayerTiles$21.smali': '0e75ae93bd7ec42a6e5eab13b643a18f82136208952bceaadf34d1fbb8b3f586',
    'smali/PreviewPlayerTiles$3.smali': 'bc8409961ea480ccef00f1d7bf1ea66741eab45bb7e71301b08fcd5ea6db916c',
    'smali/PreviewPlayerTiles$4.smali': '2833ebea9b7ba0aebe9d10276ce534d56606ab42ec90d7ba13aa761511ce6aef',
    'smali/PreviewPlayerTiles$5.smali': '5f1df5fe21277781120854bf4cc642bd53209794b0dd601b97a7da3b79d0a5bc',
    'smali/PreviewPlayerTiles$6.smali': '9d8f217de09e7e70fdf64a177b270e941a9ddb071d95f0352f88cae034ec4a10',
    'smali/PreviewPlayerTiles$7.smali': '51890db7245a6aea686e86b35777ba847edcb78b0962f953a344959cc4383f85',
    'smali/PreviewPlayerTiles$8$1.smali': 'e72bef89cdd86f766eb1719b27c2e106afde9f49518c9727ae95957cd6629790',
    'smali/PreviewPlayerTiles$8.smali': 'e257e5ce603ffad8d8c3a74ac61d59227aae0d8bc0aa8603f7917b7958cf2c41',
    'smali/PreviewPlayerTiles$9.smali': '359bd60a9eee989f559f5f0e51cdb678e67904c716f46f5373a8dbeb0a938db6',
    'smali/PreviewPlayerTiles.smali': '52e6b833379294e248a9b194f561ac3b7ef01a1186a2b72610a97e33f8ba2e9f',
    'smali/PreviewPlayerVolume$1.smali': 'fc3f18a0747770edc96bc59aeb22e4dc5be007e6aab8bd95171acc7fd318255f',
    'smali/PreviewPlayerVolume$10.smali': '097d512966d493c11586151b8fee3478beff6392e61f41df4e95928f367aa2bc',
    'smali/PreviewPlayerVolume$11$1.smali': 'ea46e6fa790f428445c78b39e465ad8e159e7baaddf64e0fb2707d5e57998cb8',
    'smali/PreviewPlayerVolume$11.smali': 'c3a4e76a24cd307879bde1af9cf825a225cf9711db5a7c63ad65d3aaeae35c78',
    'smali/PreviewPlayerVolume$12.smali': '53dc79f9e9b4e645c1431667c98b5963af0786e650c4ee2e752705795de3df9f',
    'smali/PreviewPlayerVolume$13.smali': '7ab1eecf2db1fe188c637fd17de69222dc281bde7733dc5b90f865140342b714',
    'smali/PreviewPlayerVolume$2.smali': '27c574b90304b086e6d21e97a4fc271efa1d0a59bcf6247bf8763adf55f0c0b3',
    'smali/PreviewPlayerVolume$3.smali': '09ce767538f628c0e065a922d9943ced3361ff2f1bc4fff3938a65c589d9fbf7',
    'smali/PreviewPlayerVolume$4.smali': '2e461e939653bf9c6c250e90185ac5843f8ee4afaa9013d022d6224a922dc19e',
    'smali/PreviewPlayerVolume$5.smali': 'fc848df2db89bcc7d0fdf7e6b07120f7c0e782c48ec0726d65811300100426af',
    'smali/PreviewPlayerVolume$6.smali': '7effd4ebb111a73fac618a48c263895e59b57d24088411fa51148a16e601fe7e',
    'smali/PreviewPlayerVolume$7.smali': '9b5a29be87699fe7f8dcb31dbf0b72bedcf31fee3a09046117a1ec10c3c9fc73',
    'smali/PreviewPlayerVolume$8.smali': '7a99c7ceb340f1af55f5f1398d9fe02e07e01c476a479cc4fac2a9c5f13bde10',
    'smali/PreviewPlayerVolume$9.smali': '2523e1ec853a4d0bbd19303639b7b8f7abfe31d5a8465cb3e396812ba5e2e8c1',
    'smali/PreviewPlayerVolume.smali': 'f8852ae3f1887e5fd28dc09dbd60a5451e69672568692b4913ffa87d73610bf9',
    'smali/PreviewUiRestyle$1.smali': 'd1713c69f55f62572d7d237af7abfed3aa3ebc08c67a16c5e1899d6741cd883d',
    'smali/PreviewUiRestyle$2.smali': '9bb4b7d718cc66ef94aa23f171790789c78dda5db3d798a406b93612a84725e8',
    'smali/PreviewUiRestyle$3.smali': 'c125de3b79ab91b139d1818174ec08353b6782483b54e4b521bc6906656b2a63',
    'smali/PreviewUiRestyle.smali': '3bd2300ee057c2fe93657ea1e94e917133e9091160f5c11078f9d46fc1bb6296',
    'PreviewSnapshotRenderer.java': '799e2bf909b31eaa28d427efccb3f3f49f33814fab504fe5c934432021772c95',
    'smali/PreviewSnapshotRenderer.smali': '7df3a5e66ca2f15a629867268976103a8dcbb13adfb336642d093ac853aaec3b',
    'PreviewPlayerPlayButton.java': '7b080ee533f8e3c2be8d2bba9457d0bf51c32fa44606d4e7fd4604af5189e36a',
    'PreviewPlayerDecoration.java': 'a21b4dffe6c2ba7cbce2d29012e601b88c1a5ac43b56d6cf5b578f0bc104f44d',
    'smali/PreviewPlayerPlayButton.smali': '10fa7289606a9481f8f6af0cac9e36790c1bf1ba73d9218d551ad194e9287e27',
    'smali/PreviewPlayerPlayButton$1.smali': '4fd83f3fd7382c2861383c9b7197d59d28b8dc96808e0cd32f157ccddb4af3a0',
    'smali/PreviewPlayerDecoration.smali': 'd6603b418eaf73a509548f2f74b5a89489d5259dc8b52832f9c720ded5f96f41',
    'PreviewPlayerChrome.java': 'b19feb16ababa7dff4c8cbe116a87d66bc7abf479dd58b2651f3f5815bb70e2d',
    'PreviewPlayerLikeArt.java': '49892fbb54b2c66dd9fe477fc851e55dedb2a4f8a31670e53530e5f03c289979',
    'smali/PreviewPlayerLikeArt.smali': '8caf0d0292ff562b70b85aef9fbe20f306e6bdf7239b337971c063f6fe9888ca',
    'PreviewPlayerMode.java': '0e35eae5b0bd911001b06e2558152a278d64daeff3c1feac1bd08557bd53993f',
    'PreviewPlayerTiles.java': 'e2fa076b43491aa48a25eb58c955fac8b827ea7c5da5b6d4af8951dff4abedfc',
    'PreviewPlayerVolume.java': 'deb43ffa250a200d8b6b251243a56ff317b1af50e6d877450e0f58ad7900dcc6',
    'control.js': '58376a501fdb2880cc8e68305fb01c82b03181ee82411614f12cfbb34fba07b7',
    'control-diagnostic.js': '67294cdbad572452c57c3ad1199740fbdc2bb609c6efa90c3c88109314484231',
    'volume-control.js': 'ac4bda4dc78c4bf2248c9af4864fd2246d0fb8dea435a2f929baa684f83d7160',
    'panel-structure.js': '45bcd7ac9dba68aad908a47fd66fd96e2f4feeeabcf1fac3e19399fa150a71f8',
    'panel-read.js': 'e00691f3abe98da90b181e5755cb3674581b14a4f3199bbe23ba1459a2e53368',
    'mode-job.js': '136047fbbd5a421587a03076348094fb27c5faa89a9379d284079c2334853852',
    'queue-job.js': '57b8554edf4222aa2cf959754b43c9ee5f5e6b19e3c8233a0bc565d52610c894',
    'panel-job.js': '35ad49da2e93567cd70b6ca3fbe18fa0af2b18acc8e93ae6fbb34b266276cab1',
    'smali/PreviewPlayerSheet$1.smali': '77cbb9349ab0ce5707db27b14bd0e7dc7b841c6f102dc07353e69a8827e11236',
    'smali/PreviewPlayerSheet$2.smali': '51637d526406b9d18f09bf28865ca988492110f26f3c6d8d3aca208b8c71e271',
    'smali/PreviewPlayerSheet$3.smali': 'f5e0891af913dd421595f989cf0d1a75290f6cbb53d7d9612e530c9b8197ddff',
    'smali/PreviewPlayerSheet.smali': '6a446ac3e8400574ad5fed9578d78bcbdf4aad4bb8f132df83660a7a32834a94',
    'PreviewPlayerSheet.java': '16146ddfed81cef6e81e6aec58d24c236d4f9f37efd23365b5e25a74713019e9',
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
