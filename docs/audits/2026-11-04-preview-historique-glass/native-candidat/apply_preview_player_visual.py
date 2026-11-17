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
    'smali/PreviewPlayerChrome$1.smali': 'a8f3a961e16e5fd1db54a574d2451f21ed7adebdab8e2e425c4958ca1353d374',
    'smali/PreviewPlayerChrome$2.smali': '32be64866bd0acd8d3370dd7bbf872524b46c45273067f8f00d6bfa8cd8f93a3',
    'smali/PreviewPlayerChrome$PressEffect.smali': '286693fc3043456144e6fe58e25d53661564dd0b2d5229e5ca9e1489318cb750',
    'smali/PreviewPlayerChrome.smali': 'c7222e2969f882e6dffdcdc2b9cc77c2f9b7067b1d0c0e2bc700fcddf09bbd76',
    'smali/PreviewPlayerMode$1.smali': '9c00f7f4d1844157468c919ff2578c7620dc68e4a5fc827dbb541b65042deb9e',
    'smali/PreviewPlayerMode$2.smali': '3f28c76e2ebf1fa72d2015c73f97e01daea87faab8c1a2ce79bdc5ac5b5605ab',
    'smali/PreviewPlayerMode$3.smali': 'f88ce179cd7738704f1eced4e5114a2f6d904979f247dacc6776a98a21e98893',
    'smali/PreviewPlayerMode$4.smali': 'e4e179a9c4f42cfd5376b6d328116e025aeb200529c1b1f514bbff1fc26d2b27',
    'smali/PreviewPlayerMode$5.smali': '0032657d6bf259dbc9afb63fc1610f5e62cf5a5fd9e177090166231a007ae8ed',
    'smali/PreviewPlayerMode$6.smali': '476e2190dfa3088516c4212d9f2c05eb9ea3d58d614529751667832ff4a059d5',
    'smali/PreviewPlayerMode$7$1.smali': 'e41ec322e444e95410ea00464d66a12b92be6f3276ad29081e4ff55eb5d4f93c',
    'smali/PreviewPlayerMode$7.smali': '24ff5cf3821037b9992d9a0631ed716c23772e8613fb978893ba752dc927b87f',
    'smali/PreviewPlayerMode$8.smali': 'd0b855a582a99e5563975f0925135bd5d157b0aef68d0a3ef7f945777490f7d3',
    'smali/PreviewPlayerMode$9.smali': '12c29b05b1e15f035a0fbc79e77825add72314790aa257432acb91d18a63b9f0',
    'smali/PreviewPlayerMode.smali': 'db660409746bb32a183a24d9315873304500ce2dca8a9df127fef697d9b68570',
    'smali/PreviewPlayerTiles$1.smali': '645ff05c0f82637e7b34d67a3825d2cf8cfe3a8eabf26f87f73e0d40558c0eac',
    'smali/PreviewPlayerTiles$10.smali': '288356e86ec10580db7664904e157891090cad5010595f5cdfb8929bb24b5f59',
    'smali/PreviewPlayerTiles$11.smali': '8e41ca4853456e9cfd4549ffd431cb6adee2c48e94ebeaec19844b26603867aa',
    'smali/PreviewPlayerTiles$12.smali': '873abe1bb0ebf0882ed2ef36d05cf99078ff197231d0959f7407ce742edc3e37',
    'smali/PreviewPlayerTiles$13.smali': 'ee875a4bb0b1bf67254e6a6d97a702ba9a22ca1a1c729a3b0cadef807bde5ca4',
    'smali/PreviewPlayerTiles$14$1.smali': '24df9baf6eeff4e18a95e120bd4217bece577c6329bca1c47cae042f7feb6fa2',
    'smali/PreviewPlayerTiles$14.smali': '7737e7563975935e8376eed0eb9e5653605a4407f39581c3cbf77c913597065c',
    'smali/PreviewPlayerTiles$15.smali': '8f7344df78c5a21f52a3e6a388636891bf086138ddb7e4a86832f60c1738ef6a',
    'smali/PreviewPlayerTiles$16.smali': '23e4bb8088b3adeca92efb6af43ec9512fe72bb29640fd7960311924843beb1c',
    'smali/PreviewPlayerTiles$17.smali': '7fe1c8a3d625b2e1b3b0a8a5f83bbaef14a39ec42f7654cc6dc20c756d191107',
    'smali/PreviewPlayerTiles$18.smali': 'ac70ac4eae79c837bdfe3424e975614aaacdee491d3f0464f7ea47888939bd07',
    'smali/PreviewPlayerTiles$19.smali': '77bc4d3555db296d4f065fb027e03de60a72c72cec1d9a6e2b8ae681c8e767bb',
    'smali/PreviewPlayerTiles$2.smali': '7ecf7f257c808d194f78725e0f8f4ee0c2fd65f62de084f25a6ecf548d9c562c',
    'smali/PreviewPlayerTiles$20.smali': 'fe025ea2d2d568dc43d50141583fdaf59d3131113231276c43f4b1aded11cb1b',
    'smali/PreviewPlayerTiles$21.smali': '87f05ce8209fed9c6156f53e9de00884ecff86a4f1185f64464a0aef5d4568dd',
    'smali/PreviewPlayerTiles$3.smali': '4734acaa7342152318c159309311729914093169bd42391c198ee9613189c3be',
    'smali/PreviewPlayerTiles$4.smali': 'aacad0b3480f1aee346ff62c938c28417528ed9cdd189041ce0dcf6108beeae2',
    'smali/PreviewPlayerTiles$5.smali': 'f8f541883b13cbf04eb2ca1eb00ccf41809d35b5886ec51b535f42d1cbee0df0',
    'smali/PreviewPlayerTiles$6.smali': 'e538db13f866b10d900b06029ee52055cc2668ee5bb364ad861c35ffa30e77ca',
    'smali/PreviewPlayerTiles$7.smali': '7227f6d685ee151023057a84a461d6f1e06e71b8c758ed1ccf1db5c42af6af8a',
    'smali/PreviewPlayerTiles$8$1.smali': 'ace78b9d8cf272487e8500e27f9b2d7ef3c53782a53c10585d0988c96a06d915',
    'smali/PreviewPlayerTiles$8.smali': 'a05857f5922455e1ea156ccca5eed7d533d0a82e111588f6b29ed569e3008101',
    'smali/PreviewPlayerTiles$9.smali': '2e7df8bf7ccbfc114f31cbcb0e134c3fe2248c911392b2208fabbaebf7fb6ba6',
    'smali/PreviewPlayerTiles.smali': 'b7989283876b929f1890850045d4ba17c1bfb289c9ba746c73ccbbbd5685855a',
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
    'smali/PreviewPlayerVolume.smali': 'adfa11cd17484f9799516d7b916db0604b4996e8de7763a6a6b76f9a5a640c62',
    'smali/PreviewUiRestyle$1.smali': 'd1713c69f55f62572d7d237af7abfed3aa3ebc08c67a16c5e1899d6741cd883d',
    'smali/PreviewUiRestyle$2.smali': '9bb4b7d718cc66ef94aa23f171790789c78dda5db3d798a406b93612a84725e8',
    'smali/PreviewUiRestyle.smali': '1d9cbf3acf09ae3488bdcafb169231661eb2286538af26856c81d2b8c6b6bf05',
    'PreviewPlayerPlayButton.java': '7b080ee533f8e3c2be8d2bba9457d0bf51c32fa44606d4e7fd4604af5189e36a',
    'PreviewPlayerDecoration.java': 'a21b4dffe6c2ba7cbce2d29012e601b88c1a5ac43b56d6cf5b578f0bc104f44d',
    'smali/PreviewPlayerPlayButton.smali': '10fa7289606a9481f8f6af0cac9e36790c1bf1ba73d9218d551ad194e9287e27',
    'smali/PreviewPlayerPlayButton$1.smali': '4fd83f3fd7382c2861383c9b7197d59d28b8dc96808e0cd32f157ccddb4af3a0',
    'smali/PreviewPlayerDecoration.smali': 'd6603b418eaf73a509548f2f74b5a89489d5259dc8b52832f9c720ded5f96f41',
    'PreviewPlayerChrome.java': '9fc5bcda137e049bd68bf6fa7ac4dfce03c7c25ef4da823ef005dc1516f3baab',
    'PreviewPlayerLikeArt.java': '49892fbb54b2c66dd9fe477fc851e55dedb2a4f8a31670e53530e5f03c289979',
    'smali/PreviewPlayerLikeArt.smali': '8caf0d0292ff562b70b85aef9fbe20f306e6bdf7239b337971c063f6fe9888ca',
    'PreviewPlayerMode.java': '1dbf80e4452ea579261cf34ecb4b808f4afbaf6a6b5b57734c218a0a8b39f2e9',
    'PreviewPlayerTiles.java': '6db02c3ef8de89ad4c7bbb3d3a458446a29e385b9679a6140942d52d3accaeb3',
    'PreviewPlayerVolume.java': 'eaddb73ed4d7c87c9551771ee4d7045d7e9b803a9e164675b54f5448cc39777f',
    'control.js': '689067623b00df755b50262f6fed8c2ca9a35283dd622adc5b56857c67f99d77',
    'control-diagnostic.js': '1399e373819ed9015a9f3ba9c5996d0c9cec862a709d4b72e4fdc39bb5439946',
    'volume-control.js': 'ac4bda4dc78c4bf2248c9af4864fd2246d0fb8dea435a2f929baa684f83d7160',
    'panel-structure.js': 'b7e9ab3c93dd213dc20c201d01ccf4af0078313dc538bab54aa9ddc23ed4d137',
    'panel-read.js': 'e00691f3abe98da90b181e5755cb3674581b14a4f3199bbe23ba1459a2e53368',
    'mode-job.js': 'c4f0d12e7030c06e44588488c75c42af4eba58cd7942380be1d890228ab77a91',
    'queue-job.js': '4523fead4afa515f9750a603c7ac564ef6836783e82438ba7e4c4be4fa59d4c8',
    'panel-job.js': '2c29549f8bd8965a4003eed57149528331c3e643d3dc8cd0a716c069b756a8d7',
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
                <TextView android:text="LECTURE EN COURS" android:gravity="center" android:textSize="11.0sp" android:textStyle="bold" android:letterSpacing="0.14" android:textColor="#ffcfc6f2" android:layout_width="0.0dip" android:layout_height="wrap_content" android:layout_weight="1.0" />
                <Space android:tag="previewPlayerHeaderSpacer" android:layout_width="48.0dip" android:layout_height="48.0dip" />
            </LinearLayout>
'''
    panel=one(panel,marker,marker.replace('android:gravity="center"','android:gravity="top"')+'            <com.melodix.music.PreviewPlayerChrome android:layout_width="0.0dip" android:layout_height="0.0dip" />\n'+header)
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
