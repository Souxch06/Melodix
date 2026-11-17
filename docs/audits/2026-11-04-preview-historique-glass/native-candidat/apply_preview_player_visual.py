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
    'smali/PreviewPlayerChrome$1.smali': '5936ba1d396b2769ffbd9718972c047a44ea92f32385a00a864cc466ba8b290c',
    'smali/PreviewPlayerChrome$2.smali': '43e6b20f94881187008083f703c8f5a471eb33ebae467059df676cf06caa5d6e',
    'smali/PreviewPlayerChrome$PressEffect.smali': '77e16d2d100e83297a9fd80c99f5354f1a0d8301b5444e0ec0c57cab1c8c86dc',
    'smali/PreviewPlayerChrome$3.smali': '26c39f92746dcbb337796e7bfbf5b6b29e16cd464f889839f87d95ab5b4b527f',
    'smali/PreviewPlayerChrome$DismissGesture.smali': 'd51f8b57c50f38d9f7da5825ff311ef33dcf5691db83ef9d3a63bdf1d7e1ff0c',
    'smali/PreviewPlayerChrome.smali': '1fa4098bfd98cc15323021c592321b32229223f5378a6a4a35de111029e6ea95',
    'smali/PreviewPlayerMode$1.smali': '9c00f7f4d1844157468c919ff2578c7620dc68e4a5fc827dbb541b65042deb9e',
    'smali/PreviewPlayerMode$2.smali': '3f28c76e2ebf1fa72d2015c73f97e01daea87faab8c1a2ce79bdc5ac5b5605ab',
    'smali/PreviewPlayerMode$3.smali': 'f7c931fe6e85d265bcad7da92d1b9d36180e834e19db9b036a5e7cdb09093da4',
    'smali/PreviewPlayerMode$4.smali': '9d977a3bd3f0dba835bb2021b66c88b7f53b155860948a98a79912a166fa138e',
    'smali/PreviewPlayerMode$5.smali': 'f86bd41f5629e82dbdd02c751ccaf343c4d9c79ec3d36d14534ac981b6d3b327',
    'smali/PreviewPlayerMode$6.smali': '9ce05fa10cc40c12040058e3a3d720ab144af7ce85ebf9b6695f11c2d4558f55',
    'smali/PreviewPlayerMode$7$1.smali': '6758ab1979644c969d0ab1603c0c2081ea86e8bfb0b435e7decd2d061afe70c5',
    'smali/PreviewPlayerMode$7.smali': '88d0417340249fec220a53b85037b8abbf6a232ad5217276bfa74979f544a422',
    'smali/PreviewPlayerMode$8.smali': '90a2037bd194e532ea0031e7bef9290a47b64a4bbcf3445e8940bb94dc16bd32',
    'smali/PreviewPlayerMode$9.smali': '2eb41267d4d63d795cb6711315dc96ec16af914db7f8dd0d205a096cf6a22644',
    'smali/PreviewPlayerMode.smali': '3acf833725067e18e40a78fb5eac5c10828e16232e6d050de6b76a25835ff0eb',
    'smali/PreviewPlayerTiles$1.smali': '3401aaac8afc8ad0f632f82a17b05320929fe64dd76eb8cbd3d23cd23c7c257d',
    'smali/PreviewPlayerTiles$10.smali': '8eb12b1186ed2ca0cef444c5d02e8d1eb33d45be570a0c60fe24414ae053c17e',
    'smali/PreviewPlayerTiles$11.smali': '599d7f4d5d8327c8ed8b6800454e96e122495cc5c33e7feae6ec3c0f5f96caf5',
    'smali/PreviewPlayerTiles$12.smali': 'a65c6597075dd959455dd5ba78f48d3a26b8d698217919a90a7751e0bd670ef7',
    'smali/PreviewPlayerTiles$13.smali': '46af3661d5484ff5d811d38d91d1d6f7d08c9e58b51fe934d92bd8a0304fc9d9',
    'smali/PreviewPlayerTiles$14$1.smali': 'a0b323551167e21c38dd6cb25c9f6a3aa796c1d2c69477a67d9c603520a37ea9',
    'smali/PreviewPlayerTiles$14.smali': 'a84bf7d500261c1afe005d07090a23e21892bf40260ceb888a9648a2b0d7ff3f',
    'smali/PreviewPlayerTiles$15.smali': '3fdafc80a308786004d6beac19274d8fc64c73d15ee2c318331f763cd0f30483',
    'smali/PreviewPlayerTiles$16.smali': 'f7fb6f1af369f702f49b3fe5a8e376e5fb5045a3a391d1885ad0cda8e0961b2c',
    'smali/PreviewPlayerTiles$17.smali': '724625374f8a8598b18c536687219b512c70b5c611a7ff8a4516441846905efc',
    'smali/PreviewPlayerTiles$18.smali': 'f7a08234e767ac8784652ad445809a5e6b9d5e1b292ea8c6d878cd08b6d87252',
    'smali/PreviewPlayerTiles$19.smali': '28242edc953a6738dbfbe6f23d5a61d03bbe7516c9c136905740fc683ccc38a3',
    'smali/PreviewPlayerTiles$2.smali': 'b1102cff8f1f2618cd4d44f15de4e5a45f744ee3a36b87b937d4ddd1e51a894b',
    'smali/PreviewPlayerTiles$20.smali': '35064986593e3e090c711a441c787ca7813a40c0b85a80731e540f9585c170ad',
    'smali/PreviewPlayerTiles$21.smali': '7900b26c834ddd17eb7607e0b322a34e4f377ae2470f68a8e821cb23ea0a6c61',
    'smali/PreviewPlayerTiles$3.smali': '2604388044352531c147ee5df6d7241352677f307d33c16ae9de12b9009765f0',
    'smali/PreviewPlayerTiles$4.smali': '1273dac7c8d73c2ab96468f7b71b036b5fd5e36ed9bb76d14f04779447107ee5',
    'smali/PreviewPlayerTiles$5.smali': 'af241d9bc2aa3fc768a7d7a1b9e87d373691e89e6e629df896bf1921a5b6ba0e',
    'smali/PreviewPlayerTiles$6.smali': '59989a0a4a23a9ab5fc804d86009bc72e9532ad560d1ac1ac484141ddf5c5840',
    'smali/PreviewPlayerTiles$7.smali': '45b91e82dfe1574285ddd7741fc76c680aeb26d7bc907856344c554b11de8edf',
    'smali/PreviewPlayerTiles$8$1.smali': 'ee6150d3d383ac49d57233072fab3a57d1f67c58b43a38da70cccf20ef3c9996',
    'smali/PreviewPlayerTiles$8.smali': 'befa112685a54e86d39c687be951a6a78d53d2346fa0274bae40a0503c93f041',
    'smali/PreviewPlayerTiles$9.smali': 'b98560a2cc3213a36ed1038daf37ab4754b5d74031524eea772d513ca621d13d',
    'smali/PreviewPlayerTiles.smali': 'edd38487570712f3b0c712ccb707f3e6f4bf0b5daa4d061c8441187c79f91c44',
    'smali/PreviewPlayerVolume$1.smali': '3f8a7c270712e0db8c6d84d966c129217b7cefe30e2474a4e73da89820bf5f7b',
    'smali/PreviewPlayerVolume$10.smali': 'c6524bd26d6f78d0650228dc4db3adf6ef45b70ba30abade2e7c0b291a578f33',
    'smali/PreviewPlayerVolume$11$1.smali': '1df7f553e042706dc534ad1f38f0bd5bfb1caeade18f789e791c2eb673ed61b5',
    'smali/PreviewPlayerVolume$11.smali': 'c3556733f6da858e7af518bb1225656288770935865b9a3b6d0210a8e7ae1b6d',
    'smali/PreviewPlayerVolume$12.smali': '5e8716ea98a1ec44e7d3a70bf05024a308da90e6b0dded2c1b4d69c0d745bbb3',
    'smali/PreviewPlayerVolume$13.smali': 'ec70b9f82df8a50d25abfa10dec7bfe41f00d390b13877bc15bec40a44f05f37',
    'smali/PreviewPlayerVolume$2.smali': '39d81c2534f7e66c9def0824968ab4d28badef148765996417915fa6277b1481',
    'smali/PreviewPlayerVolume$3.smali': '85581c0c9c576048c4352d886edc81daafcc0a0d438353f894ac81875009de0c',
    'smali/PreviewPlayerVolume$4.smali': '5e96b6bbff741e5bfdc41b065a1d3be614fcd1131dcda2c9b59486a79994b116',
    'smali/PreviewPlayerVolume$5.smali': '2a0e1df1aefc2d86cbe2f2be5969f1ec437926063cb70416f12eb1c2e846bd4c',
    'smali/PreviewPlayerVolume$6.smali': '18649605cbc96159b5356da9e1f85b6f97948f1dd1f72a3796bf178ec875399d',
    'smali/PreviewPlayerVolume$7.smali': '0c9f5b33b6f9d634dfc4d335b0f0de2603bdea680862a2c9d4ecdba9247c0954',
    'smali/PreviewPlayerVolume$8.smali': '9703ed69139f2aea18f23b2c96fc6eef8acff9b2e385995c9dcf91af51feedeb',
    'smali/PreviewPlayerVolume$9.smali': 'a73120ce4a575c31640e39af636c7373f42906e45d77619dca5503824511a138',
    'smali/PreviewPlayerVolume.smali': '9222b301bf16dca78902571bf0ba535d704a8ae055fedea60f7095da3d0a23ae',
    'smali/PreviewUiRestyle$1.smali': 'd1713c69f55f62572d7d237af7abfed3aa3ebc08c67a16c5e1899d6741cd883d',
    'smali/PreviewUiRestyle$2.smali': '9bb4b7d718cc66ef94aa23f171790789c78dda5db3d798a406b93612a84725e8',
    'smali/PreviewUiRestyle$3.smali': 'c125de3b79ab91b139d1818174ec08353b6782483b54e4b521bc6906656b2a63',
    'smali/PreviewUiRestyle.smali': '3bd2300ee057c2fe93657ea1e94e917133e9091160f5c11078f9d46fc1bb6296',
    'PreviewPlayerPlayButton.java': '7b080ee533f8e3c2be8d2bba9457d0bf51c32fa44606d4e7fd4604af5189e36a',
    'PreviewPlayerDecoration.java': 'a21b4dffe6c2ba7cbce2d29012e601b88c1a5ac43b56d6cf5b578f0bc104f44d',
    'smali/PreviewPlayerPlayButton.smali': '10fa7289606a9481f8f6af0cac9e36790c1bf1ba73d9218d551ad194e9287e27',
    'smali/PreviewPlayerPlayButton$1.smali': '4fd83f3fd7382c2861383c9b7197d59d28b8dc96808e0cd32f157ccddb4af3a0',
    'smali/PreviewPlayerDecoration.smali': 'd6603b418eaf73a509548f2f74b5a89489d5259dc8b52832f9c720ded5f96f41',
    'PreviewPlayerChrome.java': '9b785f1077930e2f927afa52922d8b529d01befbc9865756dfd6e527e72a9dc3',
    'PreviewPlayerLikeArt.java': '49892fbb54b2c66dd9fe477fc851e55dedb2a4f8a31670e53530e5f03c289979',
    'smali/PreviewPlayerLikeArt.smali': '8caf0d0292ff562b70b85aef9fbe20f306e6bdf7239b337971c063f6fe9888ca',
    'PreviewPlayerMode.java': '5317f548254a9af818f058545d8113104a603258b9feb2234491e40c8b4cadd6',
    'PreviewPlayerTiles.java': 'e2fc5f4e46eb303dbd8031fee2d3dadfb91446734087725da4b4ea75c6a0c58a',
    'PreviewPlayerVolume.java': 'af149a21df527d2b36d6c844a193de344eb4d9f9d02a273036adc16d174e2e52',
    'control.js': '1793f0cdb804658ff412633d850e6f0385ad07cc37690c3c0352c4789934a9f2',
    'control-diagnostic.js': '1399e373819ed9015a9f3ba9c5996d0c9cec862a709d4b72e4fdc39bb5439946',
    'volume-control.js': 'ac4bda4dc78c4bf2248c9af4864fd2246d0fb8dea435a2f929baa684f83d7160',
    'panel-structure.js': '45bcd7ac9dba68aad908a47fd66fd96e2f4feeeabcf1fac3e19399fa150a71f8',
    'panel-read.js': 'e00691f3abe98da90b181e5755cb3674581b14a4f3199bbe23ba1459a2e53368',
    'mode-job.js': 'c4f0d12e7030c06e44588488c75c42af4eba58cd7942380be1d890228ab77a91',
    'queue-job.js': '52889a0058c04d9c1d1368dddb8d4e5f4b03db22c63a1c3bceb287b4b4119a7b',
    'panel-job.js': '0560f6bfac58e91bc08e621feb2b22433fe941ad4085bc35ac72590d07e14fbe',
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
    data[activity]=one(original,entry,hook)
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
