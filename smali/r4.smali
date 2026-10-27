.class public final synthetic Lr4;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput p2, p0, Lr4;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lr4;->k:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    iget v0, p0, Lr4;->j:I

    .line 2
    .line 3
    const-string v1, "\');"

    .line 4
    .line 5
    const-string v2, "playFromUri(\'"

    .line 6
    .line 7
    sget-object v3, Lu00;->j:Lu00;

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    iget-object p0, p0, Lr4;->k:Ljava/lang/String;

    .line 11
    .line 12
    packed-switch v0, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/melodix/music/WebService;->F:Ljava/util/concurrent/ConcurrentHashMap;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroidx/media/MediaBrowserServiceCompat$Result;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v3}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void

    .line 29
    :pswitch_0
    sget-object v0, Lcom/melodix/music/WebService;->E:Ljava/util/concurrent/ConcurrentHashMap;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Landroidx/media/MediaBrowserServiceCompat$Result;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, v3}, Landroidx/media/MediaBrowserServiceCompat$Result;->sendResult(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void

    .line 43
    :pswitch_1
    sget v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 44
    .line 45
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    new-instance v3, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void

    .line 68
    :pswitch_2
    sget v0, Lcom/melodix/music/LinkHandler;->H:I

    .line 69
    .line 70
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 71
    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    new-instance v3, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    return-void

    .line 93
    :pswitch_3
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 94
    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    invoke-virtual {v0, p0, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 98
    .line 99
    .line 100
    :cond_4
    return-void

    .line 101
    :pswitch_4
    sget-object v0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 102
    .line 103
    if-eqz v0, :cond_5

    .line 104
    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v2, "if(window.SF_UPDATE) window.SF_UPDATE("

    .line 108
    .line 109
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string p0, ");"

    .line 116
    .line 117
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {v0, p0, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 125
    .line 126
    .line 127
    :cond_5
    return-void

    .line 128
    :pswitch_5
    sget v0, Lcom/melodix/music/MainActivity;->h0:I

    .line 129
    .line 130
    invoke-static {p0}, Lxg;->p(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :pswitch_6
    :try_start_0
    invoke-static {}, Lcom/squareup/picasso/Picasso;->get()Lcom/squareup/picasso/Picasso;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-virtual {v0, p0}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const/16 v0, 0x200

    .line 143
    .line 144
    invoke-virtual {p0, v0, v0}, Lcom/squareup/picasso/RequestCreator;->resize(II)Lcom/squareup/picasso/RequestCreator;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {p0}, Lcom/squareup/picasso/RequestCreator;->centerInside()Lcom/squareup/picasso/RequestCreator;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0}, Lcom/squareup/picasso/RequestCreator;->onlyScaleDown()Lcom/squareup/picasso/RequestCreator;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0}, Lcom/squareup/picasso/RequestCreator;->get()Landroid/graphics/Bitmap;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    if-eqz p0, :cond_6

    .line 161
    .line 162
    sput-object p0, Lcom/melodix/music/WebService;->B:Landroid/graphics/Bitmap;

    .line 163
    .line 164
    sget-boolean p0, Lcom/melodix/music/WebService;->r:Z

    .line 165
    .line 166
    const/4 p0, 0x0

    .line 167
    invoke-static {p0}, Lzi1;->b(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    .line 169
    .line 170
    goto :goto_0

    .line 171
    :catch_0
    move-exception p0

    .line 172
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 173
    .line 174
    .line 175
    :cond_6
    :goto_0
    return-void

    .line 176
    nop

    .line 177
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
