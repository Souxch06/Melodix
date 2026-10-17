.class public final synthetic Li9;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lf90;


# instance fields
.field public final synthetic j:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Li9;->j:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    iget p0, p0, Li9;->j:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    packed-switch p0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    check-cast p1, Ldc1;

    .line 8
    .line 9
    check-cast p2, Lqq;

    .line 10
    .line 11
    return-object p1

    .line 12
    :pswitch_0
    if-nez p1, :cond_0

    .line 13
    .line 14
    check-cast p2, Lqq;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {}, Lz0;->a()V

    .line 18
    .line 19
    .line 20
    :goto_0
    return-object v0

    .line 21
    :pswitch_1
    check-cast p2, Lqq;

    .line 22
    .line 23
    return-object p1

    .line 24
    :pswitch_2
    check-cast p1, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    check-cast p2, Lqq;

    .line 31
    .line 32
    add-int/lit8 p0, p0, 0x1

    .line 33
    .line 34
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :pswitch_3
    check-cast p1, Lsq;

    .line 40
    .line 41
    check-cast p2, Lqq;

    .line 42
    .line 43
    invoke-interface {p1, p2}, Lsq;->h(Lsq;)Lsq;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :pswitch_4
    check-cast p1, Lsq;

    .line 49
    .line 50
    check-cast p2, Lqq;

    .line 51
    .line 52
    invoke-interface {p1, p2}, Lsq;->h(Lsq;)Lsq;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :pswitch_5
    check-cast p1, Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    check-cast p2, Lqq;

    .line 64
    .line 65
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :pswitch_6
    check-cast p1, Lsq;

    .line 71
    .line 72
    check-cast p2, Lqq;

    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    invoke-interface {p2}, Lqq;->getKey()Lrq;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-interface {p1, p0}, Lsq;->l(Lrq;)Lsq;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    sget-object p1, Ls00;->j:Ls00;

    .line 89
    .line 90
    if-ne p0, p1, :cond_1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_1
    sget-object v0, Lok0;->l:Lok0;

    .line 94
    .line 95
    invoke-interface {p0, v0}, Lsq;->j(Lrq;)Lqq;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Luq;

    .line 100
    .line 101
    if-nez v1, :cond_2

    .line 102
    .line 103
    new-instance p1, Lkl;

    .line 104
    .line 105
    invoke-direct {p1, p0, p2}, Lkl;-><init>(Lsq;Lqq;)V

    .line 106
    .line 107
    .line 108
    :goto_1
    move-object p2, p1

    .line 109
    goto :goto_2

    .line 110
    :cond_2
    invoke-interface {p0, v0}, Lsq;->l(Lrq;)Lsq;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    if-ne p0, p1, :cond_3

    .line 115
    .line 116
    new-instance p0, Lkl;

    .line 117
    .line 118
    invoke-direct {p0, p2, v1}, Lkl;-><init>(Lsq;Lqq;)V

    .line 119
    .line 120
    .line 121
    move-object p2, p0

    .line 122
    goto :goto_2

    .line 123
    :cond_3
    new-instance p1, Lkl;

    .line 124
    .line 125
    new-instance v0, Lkl;

    .line 126
    .line 127
    invoke-direct {v0, p0, p2}, Lkl;-><init>(Lsq;Lqq;)V

    .line 128
    .line 129
    .line 130
    invoke-direct {p1, v0, v1}, Lkl;-><init>(Lsq;Lqq;)V

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :goto_2
    return-object p2

    .line 135
    :pswitch_7
    check-cast p1, Ljava/lang/String;

    .line 136
    .line 137
    check-cast p2, Lqq;

    .line 138
    .line 139
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-nez p0, :cond_4

    .line 150
    .line 151
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    goto :goto_3

    .line 156
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    const-string p1, ", "

    .line 162
    .line 163
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    :goto_3
    return-object p0

    .line 174
    :pswitch_8
    check-cast p1, Landroid/view/View;

    .line 175
    .line 176
    check-cast p2, Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 177
    .line 178
    sget-object p0, Lcom/melodix/music/AppSingleton;->t:Ljava/lang/ref/WeakReference;

    .line 179
    .line 180
    if-eqz p0, :cond_a

    .line 181
    .line 182
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    check-cast p0, Lcom/melodix/music/MainActivity;

    .line 187
    .line 188
    if-eqz p0, :cond_a

    .line 189
    .line 190
    iput-object p1, p0, Lcom/melodix/music/MainActivity;->Z:Landroid/view/View;

    .line 191
    .line 192
    iput-object p2, p0, Lcom/melodix/music/MainActivity;->a0:Landroid/webkit/WebChromeClient$CustomViewCallback;

    .line 193
    .line 194
    iget-object p1, p0, Lcom/melodix/music/MainActivity;->W:Landroid/widget/FrameLayout;

    .line 195
    .line 196
    if-eqz p1, :cond_5

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_5
    const p1, 0x1020002

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0, p1}, Le6;->findViewById(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    check-cast p1, Landroid/view/ViewGroup;

    .line 207
    .line 208
    if-nez p1, :cond_6

    .line 209
    .line 210
    goto :goto_4

    .line 211
    :cond_6
    new-instance p2, Landroid/widget/FrameLayout;

    .line 212
    .line 213
    invoke-direct {p2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 214
    .line 215
    .line 216
    const/high16 v1, -0x1000000

    .line 217
    .line 218
    invoke-virtual {p2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 219
    .line 220
    .line 221
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->Z:Landroid/view/View;

    .line 222
    .line 223
    const/4 v2, -0x1

    .line 224
    if-eqz v1, :cond_9

    .line 225
    .line 226
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    instance-of v4, v3, Landroid/view/ViewGroup;

    .line 231
    .line 232
    if-eqz v4, :cond_7

    .line 233
    .line 234
    move-object v0, v3

    .line 235
    check-cast v0, Landroid/view/ViewGroup;

    .line 236
    .line 237
    :cond_7
    if-eqz v0, :cond_8

    .line 238
    .line 239
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 240
    .line 241
    .line 242
    :cond_8
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 243
    .line 244
    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p2, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 248
    .line 249
    .line 250
    :cond_9
    iput-object p2, p0, Lcom/melodix/music/MainActivity;->W:Landroid/widget/FrameLayout;

    .line 251
    .line 252
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 253
    .line 254
    invoke-direct {v0, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p1, p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 258
    .line 259
    .line 260
    :goto_4
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 261
    .line 262
    const/16 p2, 0x1a

    .line 263
    .line 264
    if-lt p1, p2, :cond_a

    .line 265
    .line 266
    invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    .line 267
    .line 268
    .line 269
    move-result p1

    .line 270
    if-eqz p1, :cond_a

    .line 271
    .line 272
    invoke-virtual {p0}, Lcom/melodix/music/MainActivity;->H()V

    .line 273
    .line 274
    .line 275
    :cond_a
    sget-object p0, Lwe1;->a:Lwe1;

    .line 276
    .line 277
    return-object p0

    .line 278
    nop

    .line 279
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
