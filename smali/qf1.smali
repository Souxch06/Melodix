.class public final synthetic Lqf1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/MainActivity;

.field public final synthetic l:Landroid/widget/ProgressBar;

.field public final synthetic m:Z

.field public final synthetic n:Landroid/content/res/ColorStateList;

.field public final synthetic o:Landroid/content/res/ColorStateList;

.field public final synthetic p:Ljava/io/Serializable;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;Landroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Ljava/io/File;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lqf1;->j:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lqf1;->k:Lcom/melodix/music/MainActivity;

    .line 8
    .line 9
    iput-object p2, p0, Lqf1;->l:Landroid/widget/ProgressBar;

    .line 10
    .line 11
    iput-boolean p3, p0, Lqf1;->m:Z

    .line 12
    .line 13
    iput-object p4, p0, Lqf1;->n:Landroid/content/res/ColorStateList;

    .line 14
    .line 15
    iput-object p5, p0, Lqf1;->o:Landroid/content/res/ColorStateList;

    .line 16
    .line 17
    iput-object p6, p0, Lqf1;->p:Ljava/io/Serializable;

    .line 18
    .line 19
    return-void
.end method

.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;Ljava/io/Serializable;Landroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;I)V
    .locals 0

    .line 20
    iput p7, p0, Lqf1;->j:I

    iput-object p1, p0, Lqf1;->k:Lcom/melodix/music/MainActivity;

    iput-object p2, p0, Lqf1;->p:Ljava/io/Serializable;

    iput-object p3, p0, Lqf1;->l:Landroid/widget/ProgressBar;

    iput-boolean p4, p0, Lqf1;->m:Z

    iput-object p5, p0, Lqf1;->n:Landroid/content/res/ColorStateList;

    iput-object p6, p0, Lqf1;->o:Landroid/content/res/ColorStateList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget v0, p0, Lqf1;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    iget-object v3, p0, Lqf1;->o:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    iget-object v4, p0, Lqf1;->n:Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    iget-boolean v5, p0, Lqf1;->m:Z

    .line 10
    .line 11
    iget-object v6, p0, Lqf1;->l:Landroid/widget/ProgressBar;

    .line 12
    .line 13
    iget-object v7, p0, Lqf1;->p:Ljava/io/Serializable;

    .line 14
    .line 15
    iget-object p0, p0, Lqf1;->k:Lcom/melodix/music/MainActivity;

    .line 16
    .line 17
    packed-switch v0, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    check-cast v7, Lhz0;

    .line 21
    .line 22
    iget-object v0, v7, Lhz0;->j:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    new-instance v7, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v8, "Download failed: Server returned HTTP "

    .line 33
    .line 34
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 49
    .line 50
    .line 51
    sput-boolean v2, Lju1;->w:Z

    .line 52
    .line 53
    new-instance v0, Lrf1;

    .line 54
    .line 55
    invoke-direct {v0, v6, v5, v4, v3}, Lrf1;-><init>(Landroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :pswitch_0
    check-cast v7, Ljava/lang/Exception;

    .line 63
    .line 64
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v7, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v8, "Download error: "

    .line 71
    .line 72
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 87
    .line 88
    .line 89
    sput-boolean v2, Lju1;->w:Z

    .line 90
    .line 91
    new-instance v0, Lrf1;

    .line 92
    .line 93
    invoke-direct {v0, v6, v5, v4, v3}, Lrf1;-><init>(Landroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :pswitch_1
    check-cast v7, Ljava/io/File;

    .line 101
    .line 102
    sput-boolean v2, Lju1;->w:Z

    .line 103
    .line 104
    new-instance v0, Lrf1;

    .line 105
    .line 106
    invoke-direct {v0, v6, v5, v4, v3}, Lrf1;-><init>(Landroid/widget/ProgressBar;ZLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 110
    .line 111
    .line 112
    invoke-static {p0, v7}, Lju1;->t(Lcom/melodix/music/MainActivity;Ljava/io/File;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    nop

    .line 117
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
