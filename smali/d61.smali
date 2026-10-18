.class public final synthetic Ld61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:Ljava/util/ArrayList;

.field public final synthetic k:Lg4;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lg4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ld61;->j:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p2, p0, Ld61;->k:Lg4;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/16 v5, 0x3e

    .line 3
    .line 4
    iget-object v0, p0, Ld61;->j:Ljava/util/ArrayList;

    .line 5
    .line 6
    const-string v1, ","

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-static/range {v0 .. v5}, Lbl;->B(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr80;I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sput-object p1, Lcom/melodix/music/AppSingleton;->G:Ljava/lang/String;

    .line 15
    .line 16
    sget v0, Lcom/melodix/music/AppSingleton;->j:I

    .line 17
    .line 18
    invoke-static {}, Lm9;->f()Landroid/content/SharedPreferences$Editor;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "AaButtonOrder"

    .line 23
    .line 24
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 29
    .line 30
    .line 31
    sget-boolean p1, Lcom/melodix/music/WebService;->r:Z

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-static {p1}, Lzi1;->b(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ld61;->k:Lg4;

    .line 38
    .line 39
    invoke-virtual {p0}, Lg4;->dismiss()V

    .line 40
    .line 41
    .line 42
    return-void
.end method
