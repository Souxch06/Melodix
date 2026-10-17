.class public final Ll72;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Landroid/content/ComponentName;

.field public final synthetic k:Ly72;


# direct methods
.method public constructor <init>(Ly72;Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll72;->j:Landroid/content/ComponentName;

    .line 5
    .line 6
    iput-object p1, p0, Ll72;->k:Ly72;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll72;->k:Ly72;

    .line 2
    .line 3
    iget-object v0, v0, Ly72;->l:Li82;

    .line 4
    .line 5
    iget-object p0, p0, Ll72;->j:Landroid/content/ComponentName;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Li82;->w(Landroid/content/ComponentName;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
