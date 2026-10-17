.class Landroidx/activity/ComponentActivity$2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;


# instance fields
.field public final synthetic j:Le6;


# direct methods
.method public constructor <init>(Le6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/activity/ComponentActivity$2;->j:Le6;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 0

    .line 1
    sget-object p1, Lvh0;->ON_STOP:Lvh0;

    .line 2
    .line 3
    if-ne p2, p1, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/activity/ComponentActivity$2;->j:Le6;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->cancelPendingInputEvents()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method
