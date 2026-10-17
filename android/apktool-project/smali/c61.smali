.class public final synthetic Lc61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:Le6;

.field public final synthetic k:I

.field public final synthetic l:Ljava/util/List;

.field public final synthetic m:Ljava/util/ArrayList;

.field public final synthetic n:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Le6;ILjava/util/List;Ljava/util/ArrayList;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc61;->j:Le6;

    .line 5
    .line 6
    iput p2, p0, Lc61;->k:I

    .line 7
    .line 8
    iput-object p3, p0, Lc61;->l:Ljava/util/List;

    .line 9
    .line 10
    iput-object p4, p0, Lc61;->m:Ljava/util/ArrayList;

    .line 11
    .line 12
    iput-object p5, p0, Lc61;->n:Ljava/util/List;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    new-instance p1, Lcom/melodix/music/d;

    .line 2
    .line 3
    iget-object v0, p0, Lc61;->j:Le6;

    .line 4
    .line 5
    iget-object v1, p0, Lc61;->l:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {p1, v0, v1}, Lcom/melodix/music/d;-><init>(Le6;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Lf4;

    .line 11
    .line 12
    invoke-direct {v2, v0}, Lf4;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Lc61;->k:I

    .line 16
    .line 17
    add-int/lit8 v3, v0, 0x1

    .line 18
    .line 19
    const-string v4, "Select Action for Button "

    .line 20
    .line 21
    invoke-static {v3, v4}, Loq;->f(ILjava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    iget-object v4, v2, Lf4;->c:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v4, Lb4;

    .line 28
    .line 29
    iput-object v3, v4, Lb4;->d:Ljava/lang/CharSequence;

    .line 30
    .line 31
    new-instance v3, Lh61;

    .line 32
    .line 33
    iget-object v5, p0, Lc61;->m:Ljava/util/ArrayList;

    .line 34
    .line 35
    iget-object p0, p0, Lc61;->n:Ljava/util/List;

    .line 36
    .line 37
    invoke-direct {v3, v5, v0, v1, p0}, Lh61;-><init>(Ljava/util/ArrayList;ILjava/util/List;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, v4, Lb4;->p:Landroid/widget/ListAdapter;

    .line 41
    .line 42
    iput-object v3, v4, Lb4;->q:Landroid/content/DialogInterface$OnClickListener;

    .line 43
    .line 44
    invoke-virtual {v2}, Lf4;->g()V

    .line 45
    .line 46
    .line 47
    return-void
.end method
