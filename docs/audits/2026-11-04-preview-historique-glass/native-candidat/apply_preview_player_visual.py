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
    'smali/PreviewPlayerMode$1.smali': '96b4ac9fbbbd8c009b978c37eaf005e8f6d16d370a07a4d12a031f990c85a079',
    'smali/PreviewPlayerMode$2.smali': '86998d3fe386ac8ef10fa5f29ad769169a308c3920f60df4ec5beda5d014adce',
    'smali/PreviewPlayerMode$3.smali': '816d3f50de1b48ee2e92967800ad86136e7eed78ca37d66587c947637713b468',
    'smali/PreviewPlayerMode$4.smali': '7e7992895d8cae9e44446d56038ece67e22dc6c09eccdb48cfbe3cdb6dbb223a',
    'smali/PreviewPlayerMode$5.smali': '913ed997e91e2eca30f2471852a0db791d9544123ae9d1a882f68fac4dd3131d',
    'smali/PreviewPlayerMode$6.smali': '943da536ed864a9e8398dea9a1ae663a424695f2f899451d22add1dcf0feab4d',
    'smali/PreviewPlayerMode$7$1.smali': 'bf1e6c2e9eb603ff31a8b1736837522b46fc95ab4973c1be3524789754804170',
    'smali/PreviewPlayerMode$7.smali': '4d8d5bcc10f9c382eafd932feb09ae723b0a117824f774f601ec88c1a69a5784',
    'smali/PreviewPlayerMode$8.smali': 'f41e09df451f501c9aaf41570cb0a1f0bc86944cca68fd5960d59f73727eb7e3',
    'smali/PreviewPlayerMode$9.smali': '9a6c1d5fe854b0eb25379267f6e2a5428e8f45a0bd7d3263e48986293cc8cd23',
    'smali/PreviewPlayerMode.smali': '621e8f2ebbd8b3f9584d2d7ad02eb20bbf7f3c14fb3f770584cec5092228de9e',
    'smali/PreviewPlayerTiles$1.smali': '645ff05c0f82637e7b34d67a3825d2cf8cfe3a8eabf26f87f73e0d40558c0eac',
    'smali/PreviewPlayerTiles$10.smali': '52c36a41cb70e1b850d6a4fde5615616c6fc815ded1c8b4c95ef54c8bfa0d5c2',
    'smali/PreviewPlayerTiles$11.smali': 'bb7c65b84b29d0d33ed88c4b1d4583011a42b0aacd63d885c5e20232b30a2cb5',
    'smali/PreviewPlayerTiles$12.smali': 'acf79eaea17613d022cea5172d890c909f90a2693d705f5a1dccef2aadc4d28c',
    'smali/PreviewPlayerTiles$13.smali': 'd0dc4b81559f5e2f93b88c2dd4d97c54e4df4877953861bc7af821c8a4c13609',
    'smali/PreviewPlayerTiles$14$1.smali': '2423e4a3f5fad36070db876ac024faeea6a2d518f7466d53325b29c9cc8cf859',
    'smali/PreviewPlayerTiles$14.smali': 'c4824ca060c23bd84c6f9fac64adf5d5d64648f1959b4d9e9fba1876b8f13156',
    'smali/PreviewPlayerTiles$15.smali': '850c58405af7d78c99e3335f214f511c075794a03c6f147714dbf97ab4878968',
    'smali/PreviewPlayerTiles$16.smali': 'd6f811340e511f39f0ed68eaf5f4145e68553f26cbf9e5aa60112bddcd4bf507',
    'smali/PreviewPlayerTiles$17.smali': 'e9e1e5ba882e59d6523f260f3e2fd14584640f76d1ff02c830996af6946c2715',
    'smali/PreviewPlayerTiles$18.smali': '3075fbcc50f8fdd251f5dd0d679b94dd8d6ad4e25402d7edb221550a72410168',
    'smali/PreviewPlayerTiles$19.smali': '7d730b5809755bdd61318f5106bb0da5d66e47e89c36dd600a060d0cd4709cb8',
    'smali/PreviewPlayerTiles$2.smali': '7ecf7f257c808d194f78725e0f8f4ee0c2fd65f62de084f25a6ecf548d9c562c',
    'smali/PreviewPlayerTiles$20.smali': '7a2e97d82e1c5c435d6e885973b0486ce7343b17e2f9805cf0bba484c0c11aef',
    'smali/PreviewPlayerTiles$21.smali': '7936da1b71de24f787daa02fb9925b2298b3573f444d9d92afecb6f0bb5a27f7',
    'smali/PreviewPlayerTiles$3.smali': '4734acaa7342152318c159309311729914093169bd42391c198ee9613189c3be',
    'smali/PreviewPlayerTiles$4.smali': 'aacad0b3480f1aee346ff62c938c28417528ed9cdd189041ce0dcf6108beeae2',
    'smali/PreviewPlayerTiles$5.smali': 'f8f541883b13cbf04eb2ca1eb00ccf41809d35b5886ec51b535f42d1cbee0df0',
    'smali/PreviewPlayerTiles$6.smali': 'e538db13f866b10d900b06029ee52055cc2668ee5bb364ad861c35ffa30e77ca',
    'smali/PreviewPlayerTiles$7.smali': '7227f6d685ee151023057a84a461d6f1e06e71b8c758ed1ccf1db5c42af6af8a',
    'smali/PreviewPlayerTiles$8$1.smali': 'ace78b9d8cf272487e8500e27f9b2d7ef3c53782a53c10585d0988c96a06d915',
    'smali/PreviewPlayerTiles$8.smali': 'e839cc55e461ebf7b5c89fd899195391d8094dfa2b3bc941d08755452b6b0498',
    'smali/PreviewPlayerTiles$9.smali': 'ab2d75e3be0a9b97e7bd36da304eed9123928d681262fc03d570dfa6a8d372e8',
    'smali/PreviewPlayerTiles.smali': '7205237bff2cab395559e1d9c924235ad427832497fa51d17b032f408243e0f0',
    'smali/PreviewPlayerVolume$1.smali': '090c0008597792728fde6be3a6ed88a83123048a96370db875a4de71be203f12',
    'smali/PreviewPlayerVolume$10.smali': 'd756dec427a6793af0662a7fe0ecc55414400142773821963616830df574898c',
    'smali/PreviewPlayerVolume$11$1.smali': '00cd1a8783db52e771e438a35b9526a5af64b3812a319e6c9c8ad2d248fc2835',
    'smali/PreviewPlayerVolume$11.smali': 'ad1e5f5adc9d090abe055688471debc816cd881ec848f5adb2a998df251bf286',
    'smali/PreviewPlayerVolume$12.smali': 'd9223773c5214a8b886b4f97be99caa93c215e827bb5da23ea9dfa03c91fc769',
    'smali/PreviewPlayerVolume$13.smali': '216dd50676691fe18c7a5835a5f66f602dcc25c1c48a4c7f9bf4ef1baf8e59bc',
    'smali/PreviewPlayerVolume$2.smali': '15ab6c49a2eb0b240b1d3db2e91dfdfc35078d3d108960bd370e7230afb9cbdc',
    'smali/PreviewPlayerVolume$3.smali': '6882597ed1c863cf522bb8241bf58fab6472f8091f28eb5916c8039bae366a35',
    'smali/PreviewPlayerVolume$4.smali': '15cebef6cec25987eab05e9c65d2913e247b122dfe6e13904c199d6460e053a7',
    'smali/PreviewPlayerVolume$5.smali': '4473861ee12a41276f221c9e52fcbfb5174f4f9fd2bc83bd88883013848358f0',
    'smali/PreviewPlayerVolume$6.smali': '3020efc3e9f16c4e0cdea421c2aee6aa1afd9bf14b16847c2cd725343ac290c9',
    'smali/PreviewPlayerVolume$7.smali': '5101d85ceb03acc2aad9597d7aa1ea15c397c2e201be3039e4e99db6ec7bcf15',
    'smali/PreviewPlayerVolume$8.smali': '96511cdb1bbe01d775c6d61b927c4d40459949799f7994db8ea0bedb6d1f6504',
    'smali/PreviewPlayerVolume$9.smali': '89363a7d0d425f05621fd6c663a6d7a8fa04cff6d7a993a85c764cb0ffd5e0f4',
    'smali/PreviewPlayerVolume.smali': '1a8ccb3662c727673754a781d55e9154a45cd6b5a6066d706cd6c1f5bca9dcce',
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
    'PreviewPlayerMode.java': 'f1b7aab64b8ab11714fbd94e8e0c67fece1fd3239688a8a70a361a9a5aaaa492',
    'PreviewPlayerTiles.java': '530c435a4bb37585df251168c5eb4494ee9ca67dda3d7ffd1f0cc1ca6178db63',
    'PreviewPlayerVolume.java': '5b5f16799e0059d0eadc7bd650bd70ef9f0a51ee2aa344608afe9a21a1ec0eec',
    'control.js': '0a2ee44e9245e96b57bd10cab2ec83feb5f3632b74199726ac87a64696874cd5',
    'control-diagnostic.js': '84ed58050b1d0a3390b633e8a7b78ccc64dbccd82b8f25f20d214d4ba30f4ff9',
    'volume-control.js': 'ac4bda4dc78c4bf2248c9af4864fd2246d0fb8dea435a2f929baa684f83d7160',
    'panel-structure.js': 'b7e9ab3c93dd213dc20c201d01ccf4af0078313dc538bab54aa9ddc23ed4d137',
    'panel-read.js': 'e00691f3abe98da90b181e5755cb3674581b14a4f3199bbe23ba1459a2e53368',
    'mode-job.js': '2350417e91a073f43b08cd3fec9267c76d7e45bb64e3647706a85ade3503baf3',
    'queue-job.js': 'ec9eedc72ab8788fbc0de091d193ea231502d5162c8f8325cf252dc5aaee7908',
    'panel-job.js': '96343b50059a07f41d29d4a0ca13c9a2a2de167574a5456834c12bcb6b446b17',
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
