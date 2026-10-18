.class public final Lub2;
.super Landroid/content/BroadcastReceiver;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static volatile b:Lny0;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lub2;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    iget p0, p0, Lub2;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_7

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const p2, -0x1fa689e9

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    if-eq p1, p2, :cond_5

    .line 24
    .line 25
    const p2, -0xee52b01

    .line 26
    .line 27
    .line 28
    if-eq p1, p2, :cond_3

    .line 29
    .line 30
    const p2, -0xee413c1

    .line 31
    .line 32
    .line 33
    if-eq p1, p2, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const-string p1, "com.melodix.music.PIP_PREV"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 46
    .line 47
    if-eqz p0, :cond_7

    .line 48
    .line 49
    const-string p1, "actSkipBack();"

    .line 50
    .line 51
    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const-string p1, "com.melodix.music.PIP_NEXT"

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_4

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_4
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 65
    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    const-string p1, "actSkipForward();"

    .line 69
    .line 70
    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_5
    const-string p1, "com.melodix.music.PIP_PLAY_PAUSE"

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_6

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_6
    sget-object p0, Lcom/melodix/music/AppSingleton;->w:Ll9;

    .line 84
    .line 85
    if-eqz p0, :cond_7

    .line 86
    .line 87
    const-string p1, "actPlayPause();"

    .line 88
    .line 89
    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 90
    .line 91
    .line 92
    :cond_7
    :goto_0
    return-void

    .line 93
    :pswitch_0
    const-string p0, "com.google.android.gms.phenotype.PACKAGE_NAME"

    .line 94
    .line 95
    invoke-virtual {p2, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    if-nez p0, :cond_8

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_8
    const-string p1, "../"

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-nez p1, :cond_b

    .line 109
    .line 110
    const-string p1, "/.."

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_9

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_9
    sget-object p1, Lub2;->b:Lny0;

    .line 120
    .line 121
    if-nez p1, :cond_a

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_a
    iget-object p1, p1, Lny0;->k:Ljava/lang/Object;

    .line 125
    .line 126
    check-cast p1, Lny0;

    .line 127
    .line 128
    iget-object p1, p1, Lny0;->k:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 131
    .line 132
    invoke-virtual {p1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    check-cast p0, Lw92;

    .line 137
    .line 138
    if-eqz p0, :cond_c

    .line 139
    .line 140
    iget-object p0, p0, Lw92;->a:Lta2;

    .line 141
    .line 142
    invoke-virtual {p0}, Lta2;->b()V

    .line 143
    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_b
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    new-instance p1, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    add-int/lit8 p0, p0, 0x44

    .line 153
    .line 154
    invoke-direct {p1, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 155
    .line 156
    .line 157
    :cond_c
    :goto_2
    return-void

    .line 158
    nop

    .line 159
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
