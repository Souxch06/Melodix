.class public final synthetic Lsk0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 0

    .line 1
    iput p2, p0, Lsk0;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lsk0;->k:Lcom/melodix/music/MainActivity;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget p1, p0, Lsk0;->j:I

    .line 2
    .line 3
    const-class v0, Lcom/melodix/music/SettingsActivity;

    .line 4
    .line 5
    iget-object p0, p0, Lsk0;->k:Lcom/melodix/music/MainActivity;

    .line 6
    .line 7
    packed-switch p1, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    sget p1, Lcom/melodix/music/MainActivity;->h0:I

    .line 11
    .line 12
    new-instance p1, Landroid/content/Intent;

    .line 13
    .line 14
    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_0
    sget p1, Lcom/melodix/music/MainActivity;->h0:I

    .line 22
    .line 23
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->m:Z

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    sget p1, Lcom/melodix/music/AppSingleton;->j:I

    .line 28
    .line 29
    invoke-static {}, Lm9;->i()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    const/4 v0, 0x0

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    const-string p1, "Network Error\nTap to retry"

    .line 37
    .line 38
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    sget-boolean p1, Lcom/melodix/music/AppSingleton;->A:Z

    .line 47
    .line 48
    if-nez p1, :cond_1

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    sput-boolean p1, Lcom/melodix/music/AppSingleton;->A:Z

    .line 52
    .line 53
    sput-boolean v0, Lcom/melodix/music/AppSingleton;->l:Z

    .line 54
    .line 55
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "ServiceOn"

    .line 60
    .line 61
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 66
    .line 67
    .line 68
    new-instance p1, Lwk0;

    .line 69
    .line 70
    const/4 v0, 0x2

    .line 71
    invoke-direct {p1, p0, v0}, Lwk0;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/melodix/music/MainActivity;->w(Lp80;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    new-instance p1, Lwk0;

    .line 79
    .line 80
    const/4 v0, 0x3

    .line 81
    invoke-direct {p1, p0, v0}, Lwk0;-><init>(Lcom/melodix/music/MainActivity;I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, p1}, Lcom/melodix/music/MainActivity;->w(Lp80;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    :goto_0
    return-void

    .line 88
    :pswitch_1
    new-instance p1, Landroid/content/Intent;

    .line 89
    .line 90
    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
