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
    'PreviewPlayerPlayButton.java': '7b080ee533f8e3c2be8d2bba9457d0bf51c32fa44606d4e7fd4604af5189e36a',
    'PreviewPlayerDecoration.java': 'a21b4dffe6c2ba7cbce2d29012e601b88c1a5ac43b56d6cf5b578f0bc104f44d',
    'smali/PreviewPlayerPlayButton.smali': '10fa7289606a9481f8f6af0cac9e36790c1bf1ba73d9218d551ad194e9287e27',
    'smali/PreviewPlayerPlayButton$1.smali': '4fd83f3fd7382c2861383c9b7197d59d28b8dc96808e0cd32f157ccddb4af3a0',
    'smali/PreviewPlayerDecoration.smali': 'd6603b418eaf73a509548f2f74b5a89489d5259dc8b52832f9c720ded5f96f41',
    'smali/PreviewPlayerChrome$PressEffect.smali': 'a4b76803f7c59d13bd0b677df685dd65304c9a97aeabc9fd2ace1d4f0c0d3c74',
    'smali/PreviewPlayerChrome$2.smali': 'ba62bbb10b7d3fbeaca8a2217330ede1844ba6300d9ba51afe5e752fb736b4a1',
    'smali/PreviewPlayerChrome$1.smali': 'acdbf8b8bdd3cb853d57fb257f50292330279e7a119e2409c927b247aa0c539b',
    'smali/PreviewPlayerChrome.smali': '6b4b8f8763859707e6d211de741b26491ec20245713238329581d263033aca5d',
    'PreviewPlayerChrome.java': 'c1741fdd8ddb22b8ed63565fc280b609fc35dba90327255cdc5d5664d2851546',
    'PreviewPlayerLikeArt.java': '49892fbb54b2c66dd9fe477fc851e55dedb2a4f8a31670e53530e5f03c289979',
    'smali/PreviewPlayerLikeArt.smali': '8caf0d0292ff562b70b85aef9fbe20f306e6bdf7239b337971c063f6fe9888ca',
    'PreviewPlayerMode.java': '34369af86cefd0a2413d1d89f61b774e2c145954ae8215a2f90f46327a0587c5',
    'PreviewPlayerTiles.java': 'a4ee7b54e4aa7215c23c6ecb26223907111bcfa599c0d2055b7cab8163c33b35',
    'PreviewPlayerVolume.java': '9fa06eda4f226bd07bf67f5e1a18bd5e123262d8b80e079686cc10915856f6da',
    'control.js': '9dcf4ee33ae59ef8410ec912109c245cf6b161c053e7dbebbcf334b3f9477f0a',
    'control-diagnostic.js': '84ed58050b1d0a3390b633e8a7b78ccc64dbccd82b8f25f20d214d4ba30f4ff9',
    'volume-control.js': 'ac4bda4dc78c4bf2248c9af4864fd2246d0fb8dea435a2f929baa684f83d7160',
    'panel-structure.js': 'b7e9ab3c93dd213dc20c201d01ccf4af0078313dc538bab54aa9ddc23ed4d137',
    'panel-read.js': 'e00691f3abe98da90b181e5755cb3674581b14a4f3199bbe23ba1459a2e53368',
    'mode-job.js': '2350417e91a073f43b08cd3fec9267c76d7e45bb64e3647706a85ade3503baf3',
    'queue-job.js': 'a830daf26c9147c8ccbe9902e448b2f9b6d614a292ac449c97e237a540fcd9a2',
    'panel-job.js': '320f4bd36b45c34e63c3eef76aacea767451c0a2ca8d09647da1c397013ea483',
    'smali/PreviewPlayerMode$1.smali': '96b4ac9fbbbd8c009b978c37eaf005e8f6d16d370a07a4d12a031f990c85a079',
    'smali/PreviewPlayerMode$2.smali': '86998d3fe386ac8ef10fa5f29ad769169a308c3920f60df4ec5beda5d014adce',
    'smali/PreviewPlayerMode$3.smali': '816d3f50de1b48ee2e92967800ad86136e7eed78ca37d66587c947637713b468',
    'smali/PreviewPlayerMode$4.smali': '7e7992895d8cae9e44446d56038ece67e22dc6c09eccdb48cfbe3cdb6dbb223a',
    'smali/PreviewPlayerMode$5.smali': '1106f924ee5b2ec030324fac717cd2b5bbb5136b88c7b0df4b5429b843a3729a',
    'smali/PreviewPlayerMode$6.smali': '99d96aeeb7a3b4082d18ae19e3a3aee0ac3d77f3437f6387ab7451ba90afca47',
    'smali/PreviewPlayerMode$7$1.smali': 'dea32297f082742525e747bebeb1f7f8bffd51f39927dda3b99411dbfc0a068e',
    'smali/PreviewPlayerMode$7.smali': '61f1b6611e5567a88e8ab6f1e6cf16a05597ab12e338cb511f8904e873b8842f',
    'smali/PreviewPlayerMode$8.smali': '2e6ff82058a9d2373f5b602d87b3771c6908562c16263ee97926a213ac98cb90',
    'smali/PreviewPlayerMode$9.smali': 'e988a1c36fb4b96c0e19369504248a0147750544548d3daa89245b8c8c635cc4',
    'smali/PreviewPlayerMode.smali': '29bf333545aa851d79a42c19e2a1d280e3082ce1cb89cfd98a5abe6743a20171',
    'smali/PreviewPlayerTiles$1.smali': 'b856f4a317578a11e389a7030c8eb43c2c4ee2a8fa225a421bd9cec70ba92c72',
    'smali/PreviewPlayerTiles$10.smali': '6b43109619fc9e061bfbc34d7a0e746d5153ca4511d10714d9ea6080a8c1a89b',
    'smali/PreviewPlayerTiles$11.smali': '80b5d1ab9e1bb1a0fa5a1e52a2e3d668140451bd10ab74ad50ad42c125c85df0',
    'smali/PreviewPlayerTiles$12$1.smali': '1d005f0055c026867d1f8c13e3e27d8730f06ad7518bdbb5eeee85b0292d0b31',
    'smali/PreviewPlayerTiles$12.smali': '85cbe99eaa7e298fbc84c6c4347f42ad699042efc94213bd3309b3255aaf4080',
    'smali/PreviewPlayerTiles$13.smali': 'ab69d42f4fc892d4033f7ff5228471cfe1725a377a3535a188f37b026013feb8',
    'smali/PreviewPlayerTiles$14.smali': '91e57efda7b39d1f0921067b497dc2ccf85af25eb2963231648644cd4655bbb0',
    'smali/PreviewPlayerTiles$15.smali': 'e8c9146d03a424c13dac7ad8fd59bc9e7e572940509a86428fd75bd8bc31464f',
    'smali/PreviewPlayerTiles$16.smali': 'd5f7bf22aa2cf2549ef6519c5c05b86c819a897395897904a60793a091bfde8c',
    'smali/PreviewPlayerTiles$17.smali': '0660e811dd0a0a1aac5f9ba6c27ad345017c20e9444d1632bb8820c1e25216c0',
    'smali/PreviewPlayerTiles$18.smali': '7a10920597d82d9603f0e5e677d035966fef930797740b739d0f7a355a40283a',
    'smali/PreviewPlayerTiles$19.smali': 'b2d4e734e9900d17f4f91347e1c7fce22efe9ddfc2db3f9e035e4b1e83444edb',
    'smali/PreviewPlayerTiles$2.smali': 'd291a9c24c0ff1034b771ac07962bb6400818cfe821e07ca6de6e3996b9eec48',
    'smali/PreviewPlayerTiles$3.smali': 'f99320803a3854c8da204c5ded019215b6cf8b225dbc45c84e1092170a0a8ba0',
    'smali/PreviewPlayerTiles$4.smali': 'aa9e91ab2afbaa4b4d12d1e61bde75b576a2e9798e9e6d5bfac97f9b110ee8fd',
    'smali/PreviewPlayerTiles$5.smali': '15291c9171abefa5cb9b607dc0495887f74ea8b3b55758f57f7d07048da6d630',
    'smali/PreviewPlayerTiles$6$1.smali': '74cfe4d76926ef24ab360d7bbae7376077a3fce4c8da841b87697c846c9f3936',
    'smali/PreviewPlayerTiles$6.smali': 'c0bc02a152d707bd352492ef689924f70761620520370827fffe7bac71a87034',
    'smali/PreviewPlayerTiles$7.smali': 'f768a56e296ff4e22d13854a82eeca909171330a51811148d0dd995d83acbb6f',
    'smali/PreviewPlayerTiles$8.smali': 'ea9b0314e30d21e802928700b7211efc579103397d2418c1fc35c830a6af2e68',
    'smali/PreviewPlayerTiles$9.smali': '4d72b0a62b573be7b5f6599a2f7cf97047180433241d7abebcb58c2a10ecd803',
    'smali/PreviewPlayerTiles.smali': 'f3ee8813a93db5583e74eceddb603ff675c78b75924f4d6c7bca33e1da73218a',
    'smali/PreviewPlayerVolume$1.smali': '090c0008597792728fde6be3a6ed88a83123048a96370db875a4de71be203f12',
    'smali/PreviewPlayerVolume$10.smali': 'a67757869e2c564618403137c2dc7ec6d7b4b2061dc7f97215b08ff273e7e518',
    'smali/PreviewPlayerVolume$11$1.smali': '7f5028ac496e3772c478b2b21394f2c9b671962135023360b0d79978d0e18428',
    'smali/PreviewPlayerVolume$11.smali': '4e3a819c3ac2f16585e962b594de38f939659adce2b2783518b363d0262bbf78',
    'smali/PreviewPlayerVolume$12.smali': '2f70551bb91b9bad040e3d6ca9c52ac6869a26ed939cad8d3378e53f8789649a',
    'smali/PreviewPlayerVolume$13.smali': '100aa5fe9fabcd45bade505de877f34f7dc1eae57e2cf493937deda77b40a2d2',
    'smali/PreviewPlayerVolume$2.smali': '15ab6c49a2eb0b240b1d3db2e91dfdfc35078d3d108960bd370e7230afb9cbdc',
    'smali/PreviewPlayerVolume$3.smali': '6882597ed1c863cf522bb8241bf58fab6472f8091f28eb5916c8039bae366a35',
    'smali/PreviewPlayerVolume$4.smali': 'aff9586de991c63d79b2f162fd4e1e4ae78cab8de647d7fa4c716c29099c6d76',
    'smali/PreviewPlayerVolume$5.smali': '2d39bb70cfa4af5076701964fdb5e05e08b5f80526f73f948006f79b0e0f39db',
    'smali/PreviewPlayerVolume$6.smali': 'a77cf26b203f3f4f8015dfa54773e0abc9c6e40836164c99386d18c5cd5ff082',
    'smali/PreviewPlayerVolume$7.smali': '1f05608ed5da877d98112dedd30c00c74e6c5d76d80f5e3ccd2a7dd4c326fbf1',
    'smali/PreviewPlayerVolume$8.smali': 'fae0e49630f2fbd73c0390e351a305edfedca37437b88381c50f50a16f3a3552',
    'smali/PreviewPlayerVolume$9.smali': '7360923c5fbe43cebba2bfe7522e52a68321ebced06060b17cef13dc0f392614',
    'smali/PreviewPlayerVolume.smali': '7d0a04097394083e991a8850a6e9057f8d118ecf1d5e2c22aaa7435b44b73848',
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
