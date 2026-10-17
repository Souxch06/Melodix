.class Landroidx/activity/ComponentActivity$4;
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
    iput-object p1, p0, Landroidx/activity/ComponentActivity$4;->j:Le6;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Landroidx/activity/ComponentActivity$4;->j:Le6;

    .line 2
    .line 3
    iget-object p2, p1, Landroidx/activity/a;->o:Lhi1;

    .line 4
    .line 5
    if-nez p2, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/app/Activity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Ldm;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p2, Ldm;->a:Lhi1;

    .line 16
    .line 17
    iput-object p2, p1, Landroidx/activity/a;->o:Lhi1;

    .line 18
    .line 19
    :cond_0
    iget-object p2, p1, Landroidx/activity/a;->o:Lhi1;

    .line 20
    .line 21
    if-nez p2, :cond_1

    .line 22
    .line 23
    new-instance p2, Lhi1;

    .line 24
    .line 25
    invoke-direct {p2}, Lhi1;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p2, p1, Landroidx/activity/a;->o:Lhi1;

    .line 29
    .line 30
    :cond_1
    iget-object p1, p1, Landroidx/activity/a;->m:Landroidx/lifecycle/a;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroidx/lifecycle/a;->f(Lbi0;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
