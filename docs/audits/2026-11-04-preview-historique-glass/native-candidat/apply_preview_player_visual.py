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
    'smali/PreviewPlayerMode.smali': 'f8e2abc693fd0451a9933f9d7b7cc31b1aa51c0c9a7fae8ab7ae9fc7eaca614a',
    'smali/PreviewPlayerTiles$1.smali': 'd67acfa79e285d78008c05fde7112231db40b90e997befa1e97c26af5440c3d2',
    'smali/PreviewPlayerTiles$10.smali': '1be3b4dc59ecdfda0bfce556e2adfccf472f91e6d265bc4e3e3de251190ee1a9',
    'smali/PreviewPlayerTiles$11.smali': '716da7bba9d4948da49e497eaf81b250c8ea0b75fcb1ed2ef38ed8752a75d068',
    'smali/PreviewPlayerTiles$12.smali': '872afdcaf0d3e0cb219af7258614a3f1af623ea722e3eafc2e989c9f29f61b79',
    'smali/PreviewPlayerTiles$13.smali': 'd5cd5e9c9df16ce44185c4e17e0ca0bc2b4d1c9e299e268a48527904ec7ac682',
    'smali/PreviewPlayerTiles$14$1.smali': '86b19f475adf4d3404ea1e9b376249e598be0062d1afce6d2a251326e14fe41e',
    'smali/PreviewPlayerTiles$14.smali': 'cb78f890b1d8ca5151c9b314c6ca67194d6b4f3ac9a60aef3912d0676f86a6d6',
    'smali/PreviewPlayerTiles$15$1.smali': '45923010410bd223f6f183bca6a29f5c71ad05d05d9aa27793b6a734899c0195',
    'smali/PreviewPlayerTiles$15.smali': 'ce0ee080f646e05fbe4ffc635444b92b71271e4fb87d82c64564637e396c2fda',
    'smali/PreviewPlayerTiles$16.smali': 'cff9b18e8a2e68f2db138904e5b1c92b10a2f45194fbebcbd977bfecfa4c7de0',
    'smali/PreviewPlayerTiles$17.smali': 'ed8eac8605803efcf2fa13154eb3fe0cc90f6a75b51fdef777ea909025bbe1b2',
    'smali/PreviewPlayerTiles$18.smali': '82848498de11500ad886f732d2e3de2644dd9577fab578605caa64b372de7d29',
    'smali/PreviewPlayerTiles$19.smali': '3202f38822bf656471cd4c07034e766b3a7a4a165d12f6977f4c22eda39e7abb',
    'smali/PreviewPlayerTiles$2.smali': 'fe893e4cc1d38810d73410fe3490b72d3c2526e352b30dbdf308bc5295ff37b3',
    'smali/PreviewPlayerTiles$20.smali': '36d1c683cec31ad686dc4a11718defab06be8d1aa2d3a1c16218ac642039ee98',
    'smali/PreviewPlayerTiles$21.smali': '5c09209ed119d8a59c8880c4782da9dd4823583bbf7d2043521becd924be7a2b',
    'smali/PreviewPlayerTiles$3.smali': 'fbe0cb825037bbaa118c81898d4916f0b09b8239fdf7f8a7163f1b6264fb9926',
    'smali/PreviewPlayerTiles$4.smali': '2573509f7d651a0b129fe7c3a3231df3a216bc6c2c9e3928f1e821f7bc2876d3',
    'smali/PreviewPlayerTiles$5.smali': '3fb35a91fd4a49cc17f4fc1aff48469b43d2007f90927f27d6c8ac524b82b370',
    'smali/PreviewPlayerTiles$6.smali': 'd7a4e198a991d9ce9bbf04b422ac7a5230a0e78955d5443d9f68bb9ca5a465b8',
    'smali/PreviewPlayerTiles$7.smali': '9f62dce61a32fd155866dbfbdd98d347bc5efadcaa61260f0d3b649e1ea3ca7a',
    'smali/PreviewPlayerTiles$8$1.smali': 'e33128ea030568fa852d45788339bd91be1e86aeed0c6fc71eb811840ae79770',
    'smali/PreviewPlayerTiles$8.smali': '43c7bcfa4a8584746b532e3722182a9a28717c32970be0cbfbcd5c6e9ab15a7d',
    'smali/PreviewPlayerTiles$9.smali': '5038745284803c59e5c8baf4f7aea082eee201f7ee7dbc92ba2ed3af8bf13107',
    'smali/PreviewPlayerTiles.smali': 'b0ec37f5ffb85821c549533c1de64a618a438396a2d3203dba7914ca8b701ce3',
    'smali/PreviewPlayerVolume$1.smali': 'bbe550708c9022f18e31492d495cacb3f0414da5a2c6a8ca1ea8a85e4326aae6',
    'smali/PreviewPlayerVolume$10.smali': '89601f1dcca08e38bc26c6f0972a98a5bec1c1e40654bfb08b419e24bda6f5d2',
    'smali/PreviewPlayerVolume$11$1.smali': '3551c19f870c996bebb2ed84ef6bcefcf5a00a522dc16b3976fd8b2bb4d579bd',
    'smali/PreviewPlayerVolume$11.smali': 'ad9577999940b13a309cda565663d45b5bfed79070c7596d7cdf978ac85f0e28',
    'smali/PreviewPlayerVolume$12.smali': 'c6f5eebe5f6a4d5a7dfb7c04d8a3a073f9d2d2faa7c6eafea313fd5e126140f9',
    'smali/PreviewPlayerVolume$13.smali': '7f6925bbcde837660a4876df393d3508af09bded3843b50780dc2cbd4f215448',
    'smali/PreviewPlayerVolume$2.smali': '397570767d2173648d883672635b3cc7427868e8b09b47907f6e1120bee206d3',
    'smali/PreviewPlayerVolume$3.smali': 'aadccd2e6bd98f5fe1f9e66c3803e3f877ac79dedf0b8cab148723b118bd3cec',
    'smali/PreviewPlayerVolume$4.smali': 'bfe4ab24e20baa79fce0f7ce4046584ec550b56a5fb23792f3a06a8a5ea29993',
    'smali/PreviewPlayerVolume$5.smali': 'fc0b1f31194349306c09cd364d497ddbedf621549944a9bd2c48a9c3901c275e',
    'smali/PreviewPlayerVolume$6.smali': '6e8c4a67956f407f85846d14ce2e76da532bb53f3c1b36811596c13ad7dcc322',
    'smali/PreviewPlayerVolume$7.smali': '100eab3b412b4eea2e0eb946e1663f3b605aaa67a00aed51fa5f93680b2dfd8a',
    'smali/PreviewPlayerVolume$8.smali': '3d088d8f8dd2fb5da79ad1925936a9b37940b73e8b544c5c239638eb577f27e6',
    'smali/PreviewPlayerVolume$9.smali': '03d899fd75c962f6b68b9c4cd5710b5a50e4634b0d50784386ee70a02342bd3c',
    'smali/PreviewPlayerVolume.smali': '964ead7cfcc9edfd2e36dc6ebd0a65fac320ba6bf410cb88945c2247ad9e9add',
    'smali/PreviewUiRestyle$1.smali': 'd1713c69f55f62572d7d237af7abfed3aa3ebc08c67a16c5e1899d6741cd883d',
    'smali/PreviewUiRestyle$2.smali': '9bbfff68750540074c5275f07d71445f0446804f91d358afe223a01542bc6dee',
    'smali/PreviewUiRestyle$3.smali': 'b2b16b7cf72deff785f9f47969f76fd7f1118300fa32d6cb278f70924af794c8',
    'smali/PreviewUiRestyle$4.smali': '9ce9d0d70f8a0b0fce91a0018b1c82b2201801119b3f9ffb11e4a0decd05449b',
    'smali/PreviewUiRestyle.smali': '9a1b731fb66632387e00c7103525f52e3968eb657793bbfc0253ffe304144d74',
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
    'PreviewPlayerMode.java': '4bceab61d5eb1f19bee6f75d1b1a605003e6fd6d4ab1a95f063268e4bff9773c',
    'PreviewPlayerTiles.java': '84a19eec04df426414d4d9c97193bb28af42cc8d83789da3736033d732a9f7a1',
    'PreviewPlayerVolume.java': 'ce71e32262054d467cf7c540012327ecbf6e4bdd4478072a17c7378c6a39c997',
    'control.js': '58376a501fdb2880cc8e68305fb01c82b03181ee82411614f12cfbb34fba07b7',
    'control-diagnostic.js': '67294cdbad572452c57c3ad1199740fbdc2bb609c6efa90c3c88109314484231',
    'volume-control.js': '3abc94938fb91e84e3e5173326d5547a80d32717b6d57e1bb64e63d90a9b67af',
    'panel-structure.js': '45bcd7ac9dba68aad908a47fd66fd96e2f4feeeabcf1fac3e19399fa150a71f8',
    'panel-read.js': 'e00691f3abe98da90b181e5755cb3674581b14a4f3199bbe23ba1459a2e53368',
    'mode-job.js': 'acc354669691ad17ff282c230165c316671f725549699fc09ad031249b348547',
    'queue-job.js': '0d86da7718aa9a5fb82f482e805ffab0c78a6634d4dca9be1e1757200c0199c5',
    'panel-job.js': '27e236df8aaebd412d766a2af2579a96db6fe3e6dae083f3dc5ea877d039ed30',
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
