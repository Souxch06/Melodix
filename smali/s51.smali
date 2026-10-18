.class public final synthetic Ls51;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls51;->a:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-boolean p2, Lcom/melodix/music/AppSingleton;->F:Z

    .line 5
    .line 6
    sget p1, Lcom/melodix/music/AppSingleton;->j:I

    .line 7
    .line 8
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const-string v0, "AndAuto"

    .line 13
    .line 14
    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 19
    .line 20
    .line 21
    sget-boolean p1, Lcom/melodix/music/WebService;->r:Z

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-static {p1}, Lzi1;->b(Z)V

    .line 25
    .line 26
    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const p1, 0x3ecccccd    # 0.4f

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object p0, p0, Ls51;->a:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
